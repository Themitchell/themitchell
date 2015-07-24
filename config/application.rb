require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Themitchell
  class Application < Rails::Application

    config.time_zone = 'London'

    config.i18n.default_locale = :en

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.generators do |g|
      g.test_framework :rspec,
        fixture: true,
        views: false,
        fixture_replacement: :factory_girl
    end

    config.after_initialize do |app|
      app.config.paths.add 'app/presenters', :eager_load => true
    end
  end
end
