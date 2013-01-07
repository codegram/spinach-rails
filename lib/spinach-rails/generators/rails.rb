require 'rails'
require 'spinach'

class SpinachGenerator < Rails::Generators::Base
  def create_environment_file
    create_file "features/support/env.rb", <<-FILE
ENV['RAILS_ENV'] = 'test'
require './config/environment'

require 'minitest/spec'

module Spinach
  class FeatureSteps
    known_engines = ObjectSpace.enum_for(:each_object, ::Rails::Railtie.singleton_class).to_a
    engines_with_routes = known_engines.select{ |engine|
      engine.respond_to?(:routes) && engine.routes.named_routes.routes.present?
    }
    engines_with_routes.each do |engine|
      engine_name = engine.to_s.underscore.split("/")
      case engine_name.pop
      when "application"
        send :define_method, :main_app do
          engine.routes.url_helpers
        end
      when "engine"
        send :define_method, engine_name[0].to_sym do
          engine.routes.url_helpers
        end
      end
    end
  end
end

# require 'database_cleaner'
# DatabaseCleaner.strategy = :truncation
#
# Spinach.hooks.before_scenario{ DatabaseCleaner.clean }
#
# Spinach.config.save_and_open_page_on_failure = true
    FILE
  end
end
