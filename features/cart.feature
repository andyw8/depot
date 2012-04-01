Feature: Cart

  Scenario: Initial state

    The visitor does not have a cart until an item is added

    When I visit the store
    Then I should not have a cart
