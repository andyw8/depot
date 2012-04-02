Feature: Cart

  @product
  Scenario: Initial state

    The visitor does not have a cart until an item is added

    When I visit the store
    Then the cart should be empty
