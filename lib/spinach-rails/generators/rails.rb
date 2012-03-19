require 'rails'
require 'spinach'

class Spinach::RailsGenerator < Rails::Generators::Base
  def create_environment_file
    create_file "features/support/env.rb", <<-FILE
ENV['RAILS_ENV'] = 'test'
require './config/environment'

require 'minitest/spec'

# require 'database_cleaner'
# DatabaseCleaner.strategy :truncation
#
# Spinach.hooks.before_scenario{ DatabaseCleaner.clean }
    FILE
  end
end
