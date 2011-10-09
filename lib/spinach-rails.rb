require "spinach-rails/version"

require 'spinach'
require 'capybara'

Spinach::Runner.before_run do
  require 'spinach/capybara'
  require 'capybara/rails'
  Spinach::FeatureSteps.class_eval do
    include Spinach::FeatureSteps::Capybara
  end
end
