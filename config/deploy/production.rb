set :port, 22
set :user, 'snmspace' # e.g. 'deploy'
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'master' # e.g. 'master'

server '138.68.8.26', # e.g. 192.xxx.xxx.xxx
  roles: [:web, :app, :db],
  port: fetch(:port),
  user: fetch(:user),
  primary: true

set :deploy_to, "/home/snmspace/#{fetch(:application)}" # e.g. "/var/apps/rails_blog"

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
  user: 'deployer',
}

set :rails_env, :production
set :conditionally_migrate, true