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
      | product              | quantity |
      | Programming Ruby 1.9 | 1        |

  Scenario: Add item to cart again

    Adding multiple copies of an item is allowed. They should appear in a single cart row.

    Given the following products:
      | CoffeeScript         |
      | Programming Ruby 1.9 |
    When I visit the store
    And I add "Programming Ruby 1.9" to my cart
    And I add "Programming Ruby 1.9" to my cart again
    Then my cart should contain:
      | product              | quantity |
      | Programming Ruby 1.9 | 2        |
