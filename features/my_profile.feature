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
  And I follow "Go to Account Settings"
  Then I should see "Edit Account Information"
  And I should see "Unhappy?"

  Scenario: Change account information
  Given "test@gmail.com" is logged in using password "test1234"
  And I am on the account settings page
  When I fill in "First name" with "Jeff"
  When I fill in "Last name" with "Huang"
  When I fill in "Phone" with "5555551234"
  When I fill in "Current password" with "test1234"
  When I press "Update"
  Given I am on the schedule page
  Then the "appointment_first_name" field should contain "Jeff"
  Then the "appointment_last_name" field should contain "Huang"
  Then the "appointment_phone" field should contain "5555551234"

  Scenario: Logged out user accesses my profile
  When I am on the my profile page
  Then I should see "Sign in"
