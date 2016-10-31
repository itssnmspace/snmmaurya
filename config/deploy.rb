# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'snmmaurya'
set :repo_url, 'git@github.com:snmspace/snmmaurya.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/data/apps/snmmaurya'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

set :log_level, :debug

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

## Linked Files & Directories (Default None):
set :linked_files, %w{config/database.yml config/settings.yml config/aws.yml config/secrets.yml config/cloudinary.yml}
set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5


namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
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

# after 'deploy:setup', 'deploy:setup_solr_data_dir'