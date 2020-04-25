require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Moocschool
  class Application < Rails::Application
    config.api_only = true
    config.load_defaults 6.0
    config.middleware.use ActionDispatch::Flash

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource(
          '*',
          headers: :any,
          expose: ["Authorization"],
          methods: [:get, :patch, :put, :delete, :post, :options, :show]
        )
      end
    end

    config.navigational_formats = []

  end
end
