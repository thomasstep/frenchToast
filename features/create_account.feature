Feature: Create an account

  Scenario: Create an account
  Given I am on the create account page
  When I fill in the sign up form
  Then I should be taken back to the home page
  Given I am on the logout page
  Given I am on the login page
  When I fill in the login form
  Then I should be taken back to the home page
