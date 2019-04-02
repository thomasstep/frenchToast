Feature: Control an admin account with appointment modification privileges
  
  Background: appointments in database

  Given the following appointments exist:
  | email           | date        | time      |
  | test1@gmail.com | 2019-03-11  | Morning   |
  | test1@gmail.com | 2019-04-25  | Evening   |
  | test2@gmail.com | 2019-05-16  | Afternoon |

  Scenario: View all previous and current appointments
  Given I am logged in on an Admin account
  Then an Admin navbar tab should show up
  When I click on the Admin tab
  Then I should see a complete listing of currently scheduled appointments under the "Current Appointments" header
  And I should see an edit link next to each of these current apppointments
  And I should see a complete listing of previously scheduled appointments under the "Previous Appointments" header
  And they should be displayed as "Appointment for appointment-email on appointment-date in the appointment-time"
  
  Scenario: Modify current appointment date and times
  Given I am logged in on an Admin account
  Given I am on the Admin page
  When I click on the edit link next to the first appointment under the "Current Appointments" header
  Then I should be redirected to the edit page
  When I select the "2019-04-26" data and the "Morning" time
  And I press on the "update" button
  Then I should be redirected to the Admin page
  And I should see that the date and time of the selected appointment has updated and is displayed as "Appointment for test1@gmail.com on 2019-03-26 in the Morning"