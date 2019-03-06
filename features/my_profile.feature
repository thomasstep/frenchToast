Feature: Check that you can see appointments that you have made

  Background: users in database

  Given the following users exist:
  | email           | password     | phone      | first_name | last_name |
  | test@gmail.com  | test1234     | 5555551234 | John       | Doe       |

  Scenario: Schedule an appointment
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the schedule page
  When I fill in "vehicleYear" with "2019"
  When I fill in "vehicleMake" with "Nissan"
  When I fill in "vehicleModel" with "370Z"
  When I fill in "vehicleVin" with "1234567890"
  When I fill in "desiredDate" with "01/01/2020"
  When I fill in "desiredTime" with "Morning"
  When I press "Submit"
  Given I am on the my profile page
  Then I should see "Appointment for 01/01/2020"
