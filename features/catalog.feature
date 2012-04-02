Feature: Catalog

  The catalog lists the products available to buy

  Scenario: Products available

    Given there are products available
    When I visit the store
    Then those products should be available to buy
