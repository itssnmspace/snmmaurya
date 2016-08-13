require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Snmmaurya
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

  #Getting running server like snmmaurya as production
  server = Rails.env.production? ? "snmmaurya" : "localhost"

  config.action_mailer.default_url_options = { host: Settings.social_credentials.try(server).host, port: 7000 }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.mandrillapp.com',
    port:                 587,
    domain:               Settings.social_credentials.try(server).host,
    user_name:            Settings.social_credentials.try(server).user_name,
    password:             Settings.social_credentials.try(server).password,
    authentication:       'plain',
    enable_starttls_auto: true
  }
  end
end