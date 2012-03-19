Feature: Spinach adds the route helpers
  In order to use Rails routes
  As a developer
  I want spinach to add my defined routes

  Scenario: A constant defined in a initializer is available
    Given I create a new rails 3 app
    And I add spinach-rails to it
    And I add an initilizer that defines a constant
    And I add a test to assert if the constant is defined
    And I run the generator
    When I run spinach
    Then the features should pass
