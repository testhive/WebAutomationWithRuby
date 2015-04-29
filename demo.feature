Feature: Demo
  Make sure Cucumber and Capybara are wired up properly
  
  Scenario: Search Google
    When I search Google for "cucumber"
    Then there should be a result for "en.wikipedia.org/wiki/Cucumber"