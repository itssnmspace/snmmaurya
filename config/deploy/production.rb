set :stage, :production

server '138.68.8.26', user: "snmspace", roles: [:web, :app, :db], primary: true