# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HobbiesApp
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '/public/*', headers: :any, methods: :get
        resource '/api/*',
                 headers: :any,
                 expose: %w[X-Page X-PageTotal],
                 methods: %i[get post patch put delete options]
      end
    end

    config.load_defaults 5.2
    config.time_zone = 'America/Santiago'
    config.assets.paths << Rails.root.join('node_modules')

    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_bot, dir: 'spec/factories'

      g.view_specs false
      g.helper_specs false
    end

    config.after_initialize do
      ::CATEGORIES = %i[math sports pets food science art videogames music].freeze
    end
  end
end
