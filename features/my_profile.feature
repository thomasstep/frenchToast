Feature: Check that you can see appointments that you have made

  Background: users in database

  Given the following users exist:
  | email           | password     | phone      | first_name | last_name |
  | test@gmail.com  | test1234     | 5555551234 | John       | Doe       |

  Scenario: Schedule an appointment
  Given "test@gmail.com" is logged in using password "test1234"
  And an appointment has been made with email "test@gmail.com", VIN "1234", date "2020-01-01", time "Morning", and reason "idk"
  And I am on the my profile page
  Then I should see "Appointment for January 1, 2020"
  
  Scenario: No scheduled appointments
  Given "test@gmail.com" is logged in using password "test1234"
  And I am on the my profile page
  Then I should see "No scheduled appointments currently"
  
  Scenario: Go to account settings
  Given "test@gmail.com" is logged in using password "test1234"
  And I am on the my profile page
  And I click on "Go to Account Settings"
  Then I should see "Cancel my account"