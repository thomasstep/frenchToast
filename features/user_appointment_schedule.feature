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
  
  Scenario: Saved cars appear
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the my profile page
  And I follow "Add New Car"
  And I fill in "vehicleYear" with "2010"
  And I fill in "vehicleMake" with "Toyota"
  And I fill in "vehicleModel" with "Camry"
  And I fill in "vehicleVin" with "12345123451234512"
  And I press "Submit"
  And I am on the schedule page
  And I select "2010 Toyota Camry"
  Then the "savedCars" field should contain "12345123451234512"
