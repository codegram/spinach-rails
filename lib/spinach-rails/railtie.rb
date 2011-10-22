require 'rails'

module Spinach
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load File.expand_path(
        File.join(
          File.dirname(__FILE__), '..', '..', 'tasks/spinach.rake')
      )
    end
  end
end
