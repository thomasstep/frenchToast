Feature: Check that you can see appointments that you have made

  Background: users in database

  Given the following users exist:
  | email           | password     | phone      | first_name | last_name |
  | test@gmail.com  | test1234     | 5555551234 | John       | Doe       |

  Scenario: Schedule an appointment
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the schedule page
  When I press "Submit"
