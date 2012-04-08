Feature: Admin

  Scenario: Attempt to access admin area

    When I visit the seller admin
    Then I should be prompted to sign in

  @user
  Scenario: Login with valid credentials

    When I visit the seller admin
    And I login with valid credentials
    Then I should be welcomed

  Scenario: Login with invalid credentials

    When I visit the seller admin
    And I login with invalid credentials
    Then I should be denied access
