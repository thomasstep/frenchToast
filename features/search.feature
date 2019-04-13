Feature: Search for appointments

  Background: Appointments in database

  Given the following users exist:
  | email             | password     | phone      | first_name       | last_name        | admin |
  | test@gmail.com    | test1234     | 5555551234 | John             | Doe              | true  |
  | email1@gmail.com  | test1234     | 5555551231 | fnameone         | lnameone         | false |
  | email2@gmail.com  | test1234     | 5555551232 | fnametwo         | lnametwo         | false |
  | email3@gmail.com  | test1234     | 5555551233 | fnamethree       | lnamethree       | false |
  | email4@gmail.com  | test1234     | 5555551234 | fnamefour        | lnamefour        | false |

  Given the following appointments exist:
  | id  | first_name     | last_name      | email             | phone       | date         | time      | make  | model    | year  | VIN                 | reason |
  | 1   | fnameone       | lnameone       | email1@gmail.com  | 5555551231  | 2019-01-05   | Evening   | make  | model1   | 1910  | 12345678901234567   |  abc   |
  | 2   | fnametwo       | lnametwo       | email2@gmail.com  | 5555551232  | 2019-01-05   | Afternoon | make  | model2   | 1920  | 72345674501234561   |  def   |
  | 3   | fnamethree     | lnamethree     | email3@gmail.com  | 5555551233  | 2019-01-10   | Evening   | make  | model3   | 1930  | 67345673201234521   |  ghi   |
  | 4   | fnamefour      | lnamefour      | email4@gmail.com  | 5555551234  | 2019-01-15   | Morning   | make  | model4   | 1940  | 11345679901234500   |  jkl   |

  Scenario: Search for appointments on a specific date
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the admin page
  When I fill in "search" with "2019-01-05"
  And I press "Search Date"
  Then I should see "Appointment for email1@gmail.com on January 5, 2019 in the Evening"
  And I should see "Appointment for email2@gmail.com on January 5, 2019 in the Afternoon"

  Scenario: Search for appointments with a specific VIN number
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the admin page
  When I follow "Advanced Search"
  When I fill in "search_VIN" with "12345678901234567"
  And I press "Search"
  Then I should see "Email: email1@gmail.com"
  And I should see "Phone: 5555551231"
  And I should see "Date: January 5, 2019"
  And I should see "Time: Evening"
  And I should see "Vehicle: 1910 make model1"
  And I should see "VIN: 12345678901234567"
  And I should see "Reason: abc"

  Scenario: Search for appointments with a specific email adress
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the admin page
  When I follow "Advanced Search"
  When I fill in "search_email" with "email3@gmail.com"
  And I press "Search"
  Then I should see "Email: email3@gmail.com"
  And I should see "Phone: 5555551233"
  And I should see "Date: January 10, 2019"
  And I should see "Time: Evening"
  And I should see "Vehicle: 1930 make model3"
  And I should see "VIN: 67345673201234521"
  And I should see "Reason: ghi"

  Scenario: Search for appointments with a specific after and before date
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the admin page
  When I follow "Advanced Search"
  When I fill in "search_after_date" with "2019-01-06"
  And I fill in "search_before_date" with "2019-01-20"
  And I press "Search"
  Then I should see "Email: email3@gmail.com"
  And I should see "Email: email4@gmail.com"
  And I should not see "Email: email1@gmail.com"
  And I should not see "Email: email2@gmail.com"

  Scenario: Search for appointments with a specific time
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the admin page
  When I follow "Advanced Search"
  When I select "Evening" from "search_time"
  And I press "Search"
  Then I should see "Email: email1@gmail.com"
  And I should see "Email: email3@gmail.com"
  And I should not see "Email: email4@gmail.com"
  And I should not see "Email: email2@gmail.com"
