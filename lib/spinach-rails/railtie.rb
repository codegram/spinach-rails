require 'rails'

module Spinach
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load File.expand_path(
        File.join(
          File.dirname(__FILE__), '..', '..', 'tasks/spinach.rake')
      )
    end
    initializer "add_routes", after: :disable_dependency_loading do |app|
      routes = app.routes.url_helpers
      Spinach::FeatureSteps.send(:include, routes)
    end
  end
end
