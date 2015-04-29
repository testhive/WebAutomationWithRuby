Feature: Run in parallel 1
  AS a user
  I want to run this file in parallel
  In order to speed things up

  @setup
  Scenario: Make a search on tureng
    Given I visit main page
    When I search for "<default>"
    Then Results should contain term "the alps"

    Scenario: Wait for while
      Then I wait for "15" seconds

  @teardown
  Scenario: click a suggestion on tureng
    Given I visit main page
    When I search for "alper"
    Then I click on first suggestion

