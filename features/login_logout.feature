Feature: Check that you can log in and logout

  Background: users in database

  Given the following users exist:
  | email           | password     | phone      | first_name | last_name |
  | test@gmail.com  | test1234     | 5555551234 | John       | Doe       |

  Scenario: Login then log out
  Given "test@gmail.com" is logged in using password "test1234"
  Then I should be on the home page
  Given I am on the logout page
  Then I should be on the home page
