Feature: Renfe
  Interface tests on the renfe page

  @Renfe @Renfe1
  Scenario: Login
    Given I am on Renfe login page
    When I log as admin
    Then The login fails

  @Renfe @Renfe2
  Scenario: Customer Help
    Given I am on Renfe main page
    When I click on Customer Help
    Then The browser opens the Costumer Help page

  @Renfe @Renfe3
  Scenario: Traveling from Madrid to Barcelona
    Given I am on Renfe main page
    When I search for a travel from Madrid to Barcelona
    Then The page returns me the results

  @Renfe @Renfe4
  Scenario: Language change
    Given I am on Renfe main page
    When I click on Welcome
    Then The english page is displayed

  @Renfe @Renfe5
  Scenario: Job Hunting
    Given I am on Renfe main page
    When I click on Job appliances
    Then I search for my desired job
