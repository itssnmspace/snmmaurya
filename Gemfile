source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use mysql2 as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# gem 'nginx'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'sprockets'

gem 'rspec-rails'

#Solr Search
gem 'sunspot_rails'
gem 'progress_bar'
gem 'sunspot_solr' # optional pre-packaged Solr distribution for use in development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'rails-controller-testing'
  gem "database_cleaner"
end

group :test do
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
end

gem 'config'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


gem 'cancan'
gem 'devise'
#Social sharing
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-amazon'
gem "omniauth-google-oauth2"
gem 'omniauth-github'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'

#Seo Setting gems
gem 'metamagic'
gem 'friendly_id', '~> 5.1.0'

#Active Admin for rails 5
gem 'activeadmin', '~> 1.0.0.pre4'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'ransack',             github: 'activerecord-hackery/ransack'
gem 'draper',              '> 3.x'
gem 'kaminari'
gem 'active_admin_datetimepicker'
gem 'active_admin_editor', github: 'ejholmes/active_admin_editor'


# Heroku Deployment
# gem 'rails_12factor', group: :production


gem "sidekiq"
gem 'sinatra', github: 'sinatra', require: false 
gem 'rack-protection', require: false
# gem 'rack-protection', github: 'sinatra/rack-protection', require: false
gem 'redis'
gem 'redis-namespace'

# group :development do
#   gem 'capistrano',         require: false
#   gem 'capistrano-rvm',     require: false
#   gem 'capistrano-rails',   require: false
#   gem 'capistrano-bundler', require: false
#   gem 'capistrano3-puma',   require: false
#   gem 'capistrano3-nginx',  require: false
# end


gem 'figaro'

# Use Puma as the app server
gem 'puma'

group :development do
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-sidekiq', require: false
end

# group :development do
#   gem 'capistrano'
#   gem 'capistrano3-puma'
#   gem 'capistrano-rails', require: false
#   gem 'capistrano-bundler', require: false
#   gem 'capistrano-rvm'
# end

gem "tire"
gem 'elasticsearch-model'
gem 'elasticsearch-rails'


gem "paperclip", "~> 5.0.0"
#Storing files to cloudinary uploaded by carrierwave gem
gem 'paperclip-cloudinary'


gem 'searchkick'