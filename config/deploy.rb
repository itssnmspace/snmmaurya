# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'snmmaurya'
set :repo_url, 'git@github.com:snmspace/snmmaurya.git'
set :deploy_to, '/home/snmspace/apps/snmmaurya'

set :user,            'snmspace'
set :puma_threads,    [4, 16]
set :puma_workers,    1

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix:///tmp/snmmaurya.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord

## Defaults:
set :scm,           :git
set :branch,        :master
set :format,        :pretty
set :log_level,     :debug
set :keep_releases, 5

## Linked Files & Directories (Default None):
set :linked_files, %w{config/database.yml config/settings.yml config/aws.yml config/secrets.yml}
set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse snmspace/master`
        puts "WARNING: HEAD is not the same as snmspace/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
      invoke 'sidekiq:start'
    end
  end

  task :setup_solr_data_dir do
    run "mkdir -p #{shared_path}/solr/data"
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
  after 'deploy:publishing', 'deploy:restart'
end


# namespace :solr do
#   desc "start solr"
#   task :start, :roles => :app, :except => { :no_release => true } do
#     run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec sunspot-solr start --port=8983 --data-directory=#{shared_path}/solr/data --pid-dir=#{shared_path}/pids"
#   end
#   desc "stop solr"
#   task :stop, :roles => :app, :except => { :no_release => true } do
#     run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec sunspot-solr stop --port=8983 --data-directory=#{shared_path}/solr/data --pid-dir=#{shared_path}/pids"
#   end
#   desc "reindex the whole database"
#   task :reindex, :roles => :app do
#     stop
#     run "rm -rf #{shared_path}/solr/data"
#     start
#     run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake sunspot:solr:reindex"
#   end
# end

namespace :sidekiq do
  task :start do
    on roles(:app) do
      # execute("bundle exec sidekiq -c 10 -e production")
    end
  end
end


# Force invocation of the given task, even if it has already been run
module Capistrano::DSL
  def invoke(task, reenable: true, **args)
    Rake::Task[task].invoke(args)
    Rake::Task[task].reenable if reenable
  end
end