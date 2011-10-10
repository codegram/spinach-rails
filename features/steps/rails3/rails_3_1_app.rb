require 'aruba/api'

Feature 'Spinach works with a Rails 3.1 app' do

  include Aruba::Api

  before_scenario do
    @aruba_timeout_seconds = 100
  end

  Given "I create a new rails 3 app" do
    create_rails_app('3.1')
  end
  And "I add spinach-rails to it" do
    add_spinach_rails
  end
  And "I add some test features" do
    add_test_features
  end
  When "I run spinach" do
    run "spinach"
  end
  Then "the features should pass" do
    stop_processes!
    last_exit_status.must_equal 0
  end

  private

  def create_rails_app(version = '3.1')
    write_file(
      'Gemfile',
      " source :rubygems
        gem 'rails', '#{version}'
      ")
    run "bundle install"
    run "rm -fR rails_app"
    stop_processes!
    run 'bundle exec rails new rails_app'
    stop_processes!
    cd "rails_app"
  end

  def add_spinach_rails
    append_to_file("Gemfile", 
     "gem 'spinach-rails', group: :test, path: '#{Dir.pwd}'")
    run "bundle install"
  end

  def add_test_features
    write_file('features/test_feature.feature',
      "Feature: Test feature
         Scenario: Test scenario
           Given I am running spinach
           Then It should be all OK
      ")
    write_file('features/steps/test_feature.rb',
      "Feature 'Test feature' do
         Given 'I am running spinach' do
           visit '/'
         end
         Then 'It should be all OK' do
           page.has_content?('Rails').must_equal true
         end
       end
      ")
    write_file('features/support/env.rb',
      "require 'minitest/spec'
      require_relative '../../config/application'")
  end

end
