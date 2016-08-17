set :stage, :production
 
# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:
 
# server 'example.com', user: 'deploy', roles: %w{app db web}, my_property: :my_value
# server 'example.com', user: 'deploy', roles: %w{app web}, other_property: :other_value
server '138.68.8.26', user: 'snmspace', roles: %w{app web db}
 
 
# role-based syntax
# ==================
 
# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.
 
# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}
 
role :app, %w{snmspace@138.68.8.26}
role :web, %w{snmspace@138.68.8.26}
role :db,  %w{snmspace@138.68.8.26}