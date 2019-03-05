Feature: Login to an existing account

  Background: users in database

  Given the following users exist:
  | email           | password     | phone      | first_name | last_name |
  | test@gmail.com  | test1234     | 5555551234 | John       | Doe       |

  Scenario: Login to account
  Given I am on the login page
  When I fill in "user_email" with "test@gmail.com"
  When I fill in "user_password" with "test1234"
  When I press "Log in"
  Then I should be on the home page
  Given I am on the schedule page
  Then the "firstName" field should contain "John"
  Then the "lastName" field should contain "Doe"
  Then the "phone" field should contain "5555551234"
  Then the "email" field should contain "test@gmail.com"
