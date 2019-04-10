Feature: Add a car to your profile

  Background: users in database

  Given the following users exist:
  | email           | password     | phone      | first_name | last_name |
  | test@gmail.com  | test1234     | 5555551234 | John       | Doe       |

  Scenario: Add a car
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the my profile page
  When I follow "Add New Car"
  When I fill in "vehicleYear" with "2019"
  When I fill in "vehicleMake" with "Nissan"
  When I fill in "vehicleModel" with "370Z"
  When I fill in "vehicleVin" with "12345678901234567"
  When I press "Submit"
  Given I am on the my profile page
  Then I should see "2019 Nissan 370Z"
  Then I should see "VIN: 1234567890"
