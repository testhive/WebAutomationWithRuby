Feature: Testing data access with ruby
  As a user
  In order to access the data sets i need
  I want to have connections to data sources

  Scenario: Write and read data from a restfull service
    Given I post a pet info into petstore
    | id   | 125  |
    | name | doggy |
    When I retrieve the pet with this data from petstore
    | id | 125 |
    Then Data should match the following from petstore
    | name | doggy |

  Scenario: Write and read data from MySQL
    Given I insert these values into MySQL
    | number   | 128  |
    | name | catty |
    | surname | parry |
    | address | london |
    When I retrieve the data from MySQL
    | number | 128 |
    Then Data should match the following from MySQL
    | name | catty |
    | surname | parry |
    | address | london |

  Scenario: Write and read data from Mongo
    Given I insert these values into Mongo
      | number   | 129  |
      | name | alper |
      | surname | mermer |
    When I retrieve the data from Mongo
      | number | 129 |
    Then Data should match the following from Mongo
      | name | alper |
      | surname | mermer |

  Scenario: I read the contents of an excel file
    Given I read file with name "testhive.xls"