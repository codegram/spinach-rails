require 'rails'

module Spinach
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load File.expand_path(
        File.join(
          File.dirname(__FILE__), '..', '..', 'tasks/spinach.rake')
      )
    end
    initializer "add_routes", after: :after_initialize do |app|
      routes = app.routes.url_helpers
      Spinach::FeatureSteps.send(:include, routes)
    end
  end
end
