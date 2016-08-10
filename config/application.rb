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

    config.secret_key_base = '7330bfc4a4e582376e2c2a6d36e8d9a851cac4c332616ca143d5f40a15a5807da047cd9f2003540fac91a85d938eab3af589ba9fa8dab302fc33f15697546e2c'
  end
end
