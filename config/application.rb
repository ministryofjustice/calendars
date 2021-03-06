require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "rails/test_unit/railtie"
require "sprockets/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Calendars
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # This saves loading all 80-odd locales from the rails-i18n gem.  This doesn't affect the loading
    # of locales from config/locales
    config.i18n.available_locales = [:en, :cy]

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # config.assets.precompile += %w( )

    # Enable the asset pipeline
    config.assets.enabled = true

    config.assets.precompile += %w(
      application.css
      print.css
    )

    # Path within public/ where assets are compiled to
    config.assets.prefix = "calendars"

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # Disable Rack::Cache.
    config.action_dispatch.rack_cache = nil

    config.action_dispatch.ignore_accept_header = true

    config.middleware.use Rack::Cors do
      allow do
        origins 'callmeback.justice.gov.uk'
        resource '*', credentials: false
      end
    end
  end
end
