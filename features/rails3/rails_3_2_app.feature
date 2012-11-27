Feature: Spinach works with a Rails 3.2 app
  In order to use spinach with Rails 3.2
  As a developer
  I want spinach to be fully compatible with Rails 3.2

  Scenario: Spinach binary
    Given I create a new rails 3 app
    And I add spinach-rails to it
    And I add some test features
    And I run the generator
    When I run spinach
    Then the features should pass

  Scenario: Spinach rake task runs spinach
    Given I create a new rails 3 app
    And I add spinach-rails to it
    And I add some test features
    And I run the generator
    When I run the spinach rake task
    Then the features should pass

  Scenario: Spinach rake task generates feature_steps
    Given I create a new rails 3 app
    And I add spinach-rails to it
    And I add a test feature file without a steps file
    And I run the generator
    When I run the spinach:generate rake task
    Then a feature steps file should have been generated
