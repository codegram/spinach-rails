Feature: Spinach works with a Rails 3.1 app
  In order to use spinach with Rails 3.1
  As a developer
  I want spinach to be fully compatible with Rails 3.1

  Scenario: Boot a bare Rails 3.1 app
    Given I create a new rails 3 app
    And I add spinach-rails to it
    And I add some test features
    When I run spinach
    Then the features should pass
