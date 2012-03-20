require "spinach-rails/version"

require 'spinach'
require 'capybara'
require 'capybara/dsl'

require "spinach-rails/railtie"

Spinach.hooks.before_run do
  require 'spinach/capybara'
  require 'capybara/rails'
  Spinach::FeatureSteps.include Spinach::FeatureSteps::Capybara
end
