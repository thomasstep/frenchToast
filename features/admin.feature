Feature: Control an admin account with appointment modification privileges

  Background: appointments in database

  Given the following appointments exist:
  | email           | date        | time      | VIN               | reason | phone      | first_name | last_name | year | make | model |
  | test1@gmail.com | 2010-03-11  | Morning   | 12345678901234567 | asdf   | 5555551234 | John       | Test      | 1991 | ford | car   |
  | test1@gmail.com | 2030-04-25  | Evening   | 12345678901234567 | jkl;   | 5555551235 | John       | Test      | 1991 | ford | car   |
  | test2@gmail.com | 2040-05-16  | Afternoon | 12345678901234568 | hi     | 5555551234 | John       | Test      | 1991 | ford | car   |

  Given the following users exist:
  | email           | password     | phone      | first_name | last_name | admin |
  | test@gmail.com  | test1234     | 5555551234 | John       | Doe       | true  |
  | test1@gmail.com | test1234     | 5555551235 | Jonn       | Joe       | false |


  Scenario: View all previous and current appointments
  Given "test@gmail.com" is logged in using password "test1234"
  Then I should see "Admin"
  When I follow "Admin"
  Then I should see "Appointment for test1@gmail.com on March 11, 2010 in the Morning"
  And I should see "Appointment for test1@gmail.com on April 25, 2030 in the Evening"
  And I should see "Appointment for test2@gmail.com on May 16, 2040 in the Afternoon"

  Scenario: non-Admin user tries to see admin
  Given "test1@gmail.com" is logged in using password "test1234"
  And I am on the admin page
  Then I should see "You are not an Admin"

  Scenario: User not logged in tries to see admin
  When I go to the admin page
  Then I should see "You are not an Admin"
