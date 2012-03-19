require "spinach-rails/version"

require 'spinach'
require 'capybara'
require 'capybara/dsl'

require "spinach-rails/railtie"
require "spinach-rails/generators"

Spinach.hooks.before_run do
  require 'spinach/capybara'
  require 'capybara/rails'
  Spinach::FeatureSteps.class_eval do
    include Spinach::FeatureSteps::Capybara
  end
end
