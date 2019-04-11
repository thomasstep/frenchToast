Feature: Login to an existing account

  Background: users in database

  Given the following users exist:
  | email           | password     | phone      | first_name | last_name |
  | test@gmail.com  | test1234     | 5555551234 | John       | Doe       |

  Scenario: Login to account
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the schedule page
  Then the "appointment_first_name" field should contain "John"
  Then the "appointment_last_name" field should contain "Doe"
  Then the "appointment_phone" field should contain "5555551234"
  Then the "appointment_owner_email" field should contain "test@gmail.com"

  Scenario: Schedule an appointment
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the schedule page
  Then the "appointment_first_name" field should contain "John"
  Then the "appointment_last_name" field should contain "Doe"
  Then the "appointment_phone" field should contain "5555551234"
  Then the "appointment_owner_email" field should contain "test@gmail.com"
  When I fill in "appointment_year" with "1990"
  And I fill in "appointment_make" with "Toyota"
  And I fill in "appointment_model" with "Supra"
  And I fill in "appointment_VIN" with "12345678901234567"
  And I fill in "appointment_date" with "2040-01-01"
  And I select "Morning" from "appointment_time"
  And I fill in "appointment_reason" with "Cucumber testing"
  And I press "Submit"
  Then I should be on the my profile page
  
  Scenario: Saved cars appear
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the my profile page
  And I follow "Add New Car"
  And I fill in "car_year" with "2010"
  And I fill in "car_make" with "Toyota"
  And I fill in "car_model" with "Camry"
  And I fill in "car_VIN" with "12345123451234512"
  And I press "Submit"
  And I am on the schedule page
  And I select "2010 Toyota Camry"
  Then the "savedCars" field should contain "12345123451234512"
