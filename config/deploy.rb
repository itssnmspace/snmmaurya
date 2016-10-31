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



namespace :sunspotsolrsearch do
  task :stop do
    on roles(:web) do
      within current_path do
        with rails_env: fetch(:rails_env, 'production') do
          begin
            #roles          =>   web
            #current_path   =>   /path_to/youproject/current
            #rails_env      =>   production
            #execute        =>   execute command with bundle exec
            #finally which command runs: RAILS_ENV=production bundle exec rake sunspot:solr:stop
            execute :bundle, 'exec', :rake, 'sunspot:solr:stop'
          rescue Exception => e
            puts " ------- Unable to stop because of: #{e.message}"
          end
        end
      end
    end
  end

  task :start do
    on roles(:web) do
      within current_path do
        with rails_env: fetch(:rails_env, 'production') do
          begin
            execute :bundle, 'exec', :rake, 'sunspot:solr:start'
          rescue Exception => e
            puts " ------- Unable to start because of: #{e.message}"
          end
        end
      end
    end
  end

  task :restart do
    on roles(:web) do
      within current_path do
        with rails_env: fetch(:rails_env, 'production') do
          begin
            execute :bundle, 'exec', :rake, 'sunspot:solr:restart'
          rescue Exception => e
            puts " ------- Unable to restart because of: #{e.message}"
          end
        end
      end
    end
  end

  task :reindex do
    on roles(:web) do
      within current_path do
        with rails_env: fetch(:rails_env, 'production') do
          begin
            execute :bundle, 'exec', :rake, 'sunspot:solr:reindex'
          rescue Exception => e
            puts " ------- Unable to reindex because of: #{e.message}"
          end
        end
      end
    end
  end
end

#Run the tasks just after deployment finish
#You can configure what are the the task you want to run
# after "deploy", "sunspotsolrsearch:stop"
# after "deploy", "sunspotsolrsearch:start"
# after "deploy", "sunspotsolrsearch:restart"
after "deploy", "sunspotsolrsearch:reindex"