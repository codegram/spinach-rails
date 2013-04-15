require 'aruba/api'

module RailsFixtures
  include Spinach::DSL
  include Aruba::Api

  Given "I create a new rails 3 app" do
    create_rails_app('3.2')
  end

  And "I add spinach-rails to it" do
    add_spinach_rails
  end

  And "I add some test features" do
    add_test_features
  end

  When "I run spinach" do
    run "spinach"
    stop_processes!
  end

  Then "the features should pass" do
    last_exit_status.must_equal 0
  end

  And "I run the generator" do
    run "bundle exec rails g spinach"
    stop_processes!
  end

  private

  def create_rails_app(version = '3.2')
    @aruba_timeout_seconds = 100
    write_file(
      'Gemfile',
      " source :rubygems
        gem 'rails', '#{version}'
        gem 'sqlite3'
      ")
    run "bundle install"
    run "rm -fR rails_app"
    stop_processes!
    run 'bundle exec rails new rails_app'
    stop_processes!
    cd "rails_app"
    write_file('config/routes.rb', "
                RailsApp::Application.routes.draw do
                  root to: redirect('/index.html')
                end
               ")
  end

  def add_spinach_rails
    append_to_file("Gemfile",
     "gem 'spinach-rails', group: [:test, :development], path: '#{Dir.pwd}'")
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
      "class TestFeature < Spinach::FeatureSteps
         Given 'I am running spinach' do
           visit root_path
         end
         Then 'It should be all OK' do
           page.has_content?('Rails').must_equal true
         end
       end
      ")
  end
end

