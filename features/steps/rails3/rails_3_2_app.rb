require 'aruba/api'

class SpinachRails3_2 < Spinach::FeatureSteps

  feature 'Spinach works with a Rails 3.2 app'
  include RailsFixtures
  include Aruba::Api

  When  'I run the spinach rake task' do
    run "rake spinach"
  end

  And 'I add a test feature file without a steps file' do
    write_file('features/test_feature.feature',
      "Feature: Test feature
         Scenario: Test scenario
           Given I am running spinach
           Then It should be all OK
      ")
  end

  When  'I run the spinach:generate rake task' do
    run "rake spinach:generate"
  end

  Then 'a feature steps file should have been generated' do
    stop_processes!
    in_current_dir do
      File.exists?('features/steps/test_feature.rb').must_equal true
    end
  end
end
