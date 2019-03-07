Feature: Login to an existing account

  Background: users in database

  Given the following users exist:
  | email           | password     | phone      | first_name | last_name |
  | test@gmail.com  | test1234     | 5555551234 | John       | Doe       |

  Scenario: Login to account
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the schedule page
  Then the "firstName" field should contain "John"
  Then the "lastName" field should contain "Doe"
  Then the "phone" field should contain "5555551234"
  Then the "email" field should contain "test@gmail.com"
