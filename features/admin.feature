Feature: Control an admin account with appointment modification privileges

  Background: appointments in database

  Given the following appointments exist:
  | email           | date        | time      | VIN               | reason |
  | test1@gmail.com | 2010-03-11  | Morning   | 12345678901234567 | asdf   |
  | test1@gmail.com | 2030-04-25  | Evening   | 12345678901234567 | jkl;   |
  | test2@gmail.com | 2040-05-16  | Afternoon | 12345678901234568 | hi     |

  Given the following users exist:
  | email           | password     | phone      | first_name | last_name | admin |
  | test@gmail.com  | test1234     | 5555551234 | John       | Doe       | true  |

  Scenario: View all previous and current appointments
  Given "test@gmail.com" is logged in using password "test1234"
  Then I should see "Admin"
  When I follow "Admin"
  Then I should see "Appointment for test1@gmail.com on 2010-03-11 in the Morning"
  And I should see "Appointment for test1@gmail.com on 2030-04-25 in the Evening Edit"
  And I should see "Appointment for test2@gmail.com on 2040-05-16 in the Afternoon Edit"

  Scenario: Modify current appointment date and times
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the admin page
  When I edit appointment 1
  When I fill in "appointment[date]" with "1990-04-26"
  When I fill in "appointment_time" with "Morning"
  When I press "update"
  Then I should see "Current Appointments"
  And I should see "Appointment for test1@gmail.com on 1990-03-26 in the Morning"
