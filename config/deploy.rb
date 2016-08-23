# config valid only for current version of Capistrano
lock '3.6.0'

# Change these
server '138.68.8.26', roles: [:web, :app, :db], primary: true

set :repo_url,        'git@github.com:snmspace/snmmaurya.git'
set :application,     'snmmaurya'
set :user,            'snmspace'
set :puma_threads,    [4, 16]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        true
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord


# set :rvm_ruby_version, 'ruby-2.3.1@snmspace'

# set :default_env, { rvm_bin_path: '~/.rvm/bin' }
#Assets adding prefix as in environments/production.rb
# set :assets_prefix, "/shared/public/assets"
# set :bundle_binstubs, -> { shared_path.join('bin') }

## Defaults:
set :scm,           :git
set :branch,        :master
set :format,        :pretty
set :log_level,     :debug
set :keep_releases, 5

## Linked Files & Directories (Default None):
set :linked_files, %w{config/database.yml config/settings.yml config/aws.yml config/secrets.yml config/puma.rb}
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
    end
  end

  
  # after 'deploy:started', 'reenable_phased_restart'
  # task :reenable_phased_restart do
  #   ::Rake.application['puma:phased-restart'].reenable
  # end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart

end




# namespace :sunspot do
#   desc 'setup solr data dir'
#   task :setup_solr_data_dir do
#     on roles :app do
#       within shared_path do
#         execute :mkdir, "-p #{shared_path}/solr"
#       end
#     end
#   end
#   desc 'link to solr shared dirs'
#   task :link_to_solr_shared_dirs do
#     on roles :app do
#       within shared_path do
#         execute :rm, "-rf #{release_path}/solr/solr"
#         execute :ln, "-sfn #{shared_path}/solr #{release_path}/solr"
#         execute :ln, "-sfn #{shared_path}/pids #{release_path}/solr/pids"
#       end
#     end
#   end
#   desc 'start solr'
#   task :start do
#     on roles :app do
#       within release_path do
#         execute :rake, "sunspot:solr:start RAILS_ENV=#{fetch :stage}"
#       end
#     end
#   end
#   desc 'stop solr'
#   task :stop do
#     on roles :app do
#       within release_path do
#         execute :rake, "sunspot:solr:stop RAILS_ENV=#{fetch :stage};true"
#       end
#     end
#   end
#   desc 'reindex solr'
#   task :reindex do
#     on roles :app do
#       within release_path do
#         execute :rake, "sunspot:solr:reindex RAILS_ENV=#{fetch :stage};true"
#       end
#     end
#   end
# end
# after 'deploy:check', 'sunspot:setup_solr_data_dir'
# before 'deploy:publishing', 'sunspot:link_to_solr_shared_dirs'
# before 'deploy:publishing', 'sunspot:stop'
# before 'deploy:publishing', 'sunspot:start'
# before 'deploy:publishing', 'sunspot:reindex'

# http://ccaloha.cc/blog/2014/04/30/howto-setup-sunspot-in-rails4-and-deploy-to-ubuntu12-dot-04-using-capistrano/
# https://docs.omniref.com/ruby/gems/h2ocube_rails_sunspot/0.0.4/files/lib/capistrano/tasks/sunspot.cap

# I want make these tasks in capistrano. Now I perform these tasks manually:

# 1º I kill sunspot solr pid with:

# a) Find the pid with ps aux | grep 'solr'

# b) Kill pid with kill pid_number

# 2º Remove index solr in production environment if exist with:

# a) rm -r solr/data/production/index

# 3º turn on sunspot solr with:

# a) RAILS_ENV=production rake sunspot:solr:start

# 4º Reindex models with:

# a) RAILS_ENV=production rake sunspot:mongo:reindex

# My question is:


# namespace :solr do
#   task :stop do
#     on roles(:app) do
#      run "cd #{current_path} && rake sunspot:solr:stop RAILS_ENV=production"
#     end
#   end
#   task :start do
#     on roles(:app) do
#       run "cd #{current_path} && rake sunspot:solr:start RAILS_ENV=production"
#     end
#   end
#   task :reindex do
#     on roles(:app) do
#       run "cd #{current_path} && rake sunspot:solr:reindex RAILS_ENV=production"
#     end
#   end
# end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma