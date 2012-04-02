Feature: Cart

  @product
  Scenario: Initial state

    The visitor does not have a cart until an item is added

    When I visit the store
    Then the cart should be empty

  Scenario: Add item to cart

    Given the following products:
      | CoffeeScript         |
      | Programming Ruby 1.9 |
    When I visit the store
    And I add "Programming Ruby 1.9" to my cart
    Then my cart should contain:
      | product      | quantity |
      | CoffeeScript | 1        |
