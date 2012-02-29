class SpinachAddsTheRouteHelpers < Spinach::FeatureSteps
  include RailsFixtures

  And 'I add an initilizer that defines a constant' do
    write_file('config/initializers/yay.rb', 'MYCONST = 10')
  end

  And 'I add a test to assert if the constant is defined' do
    write_file('features/test_constant.feature',
      "Feature: Test constant
         Scenario: Test constant
           Given I am running spinach
           Then the constant should be defined
      ")

    write_file('features/steps/test_constant.rb',
      "class TestConstant < Spinach::FeatureSteps
         Given 'I am running spinach' do
           visit root_path
         end

         Then 'the constant should be defined' do
           MYCONST.must_equal 10
         end
       end
      ")
  end
end
