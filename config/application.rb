require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module NumberSenseiRails4
  class Application < Rails::Application

    # don't generate RSpec tests for views and helpers
    config.generators do |g|

      g.test_framework :rspec, :fixture => true
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'


      g.view_specs false
      g.helper_specs false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de


    # load models in subdirectories
    config.autoload_paths = Dir[
        "#{config.root}/app/models/values/**/",
        "#{config.root}/app/models/expressions/**/",
        "#{config.root}/app/models/gamification/**/",
        "#{config.root}/app/enums/**/",
        #"#{config.root}/lib/**/",
        "#{config.root}/lib",
    ]

    ######################
    # CONSTANTS
    ######################
    config.app_title = '#Sensei'
    config.app_description = 'Number Sensei makes learning mathematics simple and addicting, by motivating kids and teachers, providing resources, and improving everything important with fun and games'

    # Disable asset generation in Rails generator
    config.generators.stylesheets = false
    config.generators.javascripts = false
  end
end
