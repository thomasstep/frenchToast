Feature: Check that the navbar links are changing

  Background: users in database

  Given the following users exist:
  | email           | password     | phone      | first_name | last_name |
  | test@gmail.com  | test1234     | 5555551234 | John       | Doe       |

  Scenario: Not logged in to account
  Given I am on the home page
  Then I should see "Sign In"
  Then I should see "Sign Up"
  Then I should not see "My Profile"
  Then I should not see "Logout"

  Scenario: Logged in to account
  Given "test@gmail.com" is logged in using password "test1234"
  Then I should see "My Profile"
  Then I should see "Logout"
  Then I should not see "Sign In"
  Then I should not see "Sign Up"
