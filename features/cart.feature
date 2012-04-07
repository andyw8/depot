Feature: Cart

  @product
  Scenario: Initial state

    The visitor does not have a cart until an item is added

    When I visit the store
    Then my cart should be empty

  Scenario: Add item to cart

    Given the products:
      | CoffeeScript         |
      | Programming Ruby 1.9 |
    When I visit the store
    And I add "Programming Ruby 1.9" to my cart
    Then my cart should contain:
      | product              | quantity |
      | Programming Ruby 1.9 | 1        |

  Scenario: Add item to cart again

    Multiple copies of an item can be added. They should appear in a single cart row.

    Given the products:
      | CoffeeScript         |
      | Programming Ruby 1.9 |
    When I visit the store
    And I add "Programming Ruby 1.9" to my cart
    And I add "Programming Ruby 1.9" to my cart again
    Then my cart should contain:
      | product              | quantity |
      | Programming Ruby 1.9 | 2        |

  Scenario: Add different items to cart

    Items should appear in the order they were added

    Given the products:
      | CoffeeScript         |
      | Programming Ruby 1.9 |
    When I visit the store
    And I add "Programming Ruby 1.9" to my cart
    And I add "CoffeeScript" to my cart
    Then my cart should contain:
      | product              | quantity |
      | Programming Ruby 1.9 | 1        |
      | CoffeeScript         | 1        |

  Scenario: Empty cart

    Given my cart contains products
    When I empty my cart
    Then my cart should be empty
