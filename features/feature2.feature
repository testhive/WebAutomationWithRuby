Feature: Run in parallel 1
  AS a user
  I want to run this file in parallel
  In order to speed things up

  Background: Visit Site
    Given I visit main page

  Scenario: Make a search on tureng
    When I search for "alpler"
    Then Results should contain term "the alps"

  Scenario: Wait for while
    Then I wait for "20" seconds

  Scenario: click a suggestion on tureng
    When I search for "alper"
    Then I click on first suggestion

  Scenario Outline: I search for multiple items
    Then I search for "<input>"
    Examples:
    | input  |
    | ahmet  |
    | mehmet |