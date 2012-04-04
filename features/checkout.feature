Feature: Checkout

  @product
  Scenario: Cart is empty

    Given my cart is empty
    Then I should not be able to check out

  Scenario: Successful checkout

    Given my cart contains products
    When I check out with valid details
    Then the order should be placed

  # Scenario Outline: Attempt to complete checkout without completing mandatory fields
  #
  #   The name, address, email and pay type fields are mandatory
  #
  #   Given I am checking out with valid details
  #   But I leave the <field> blank
  #   When I attempt to place the order
  #   Then the order should not be placed
  #
  #   Examples:
  #     | field    |
  #     | name     |
  #     | address  |
  #     | email    |
  #     | pay type |
  #
  # Scenario: Attempt to check out with an invalid email address
  #
  #   We check the format of the email address. Although this is not foolproof, it should
  #   catch simple mistakes
  #
  #   Given I am checking out with valid details
  #   But I fill in an invalid email address
  #   When I attempt to place the order
  #   Then the order should not be placed
