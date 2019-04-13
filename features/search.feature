Feature: Search for appointments
  
  Background: Appointments in database
  
  Given the following appointments exist:
  | id  | first_name | last_name  | email             | phone       | date        | time      | make   | model    | year  | VIN                 | reason |
  | 1   | fname1     | lname1     | email1@gmail.com  | 1234567890  | 2019-01-5   | evening   | make1  | model1   | 1600  | 12345678901234567   |  abc   |
  | 2   | fname2     | lname2     | email2@gmail.com  | 0987654321  | 2019-01-5   | afternoon | make2  | model2   | 1700  | 72345674501234561   |  def   |
  | 3   | fname3     | lname3     | email3@gmail.com  | 5463728190  | 2019-01-10  | evening   | make3  | model3   | 1800  | 67345673201234521   |  ghi   |
  | 4   | fname4     | lname4     | email4@gmail.com  | 0246813579  | 2019-01-15  | morning   | make4  | model4   | 1900  | 11345679901234500   |  ghi   |
  
  Scenario: Search for appointments on a specific date
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the Admin page
  Then I should see date field search box
  When I select "01/05/2019"
  And I click the 'Search Date' button
  Then I should see "Appointment for email1@gmail.com on January 1, 2019 in the Morning"
  And I should see "Appointment for email2@gmail.com on January 1, 2019 in the Afternoon"
  
  Scenario: Search for appointments with a specific VIN number
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the Admin page
  Then I should see an 'advanced search' link
  When I click on it
  Then I should see a search form with a VIN text field
  When I enter '12345678901234567' into the VIN text field
  And I click the 'Search' button
  Then I should see "fname1 lname1"
  And I should see "Email: email1@gmail.com"
  And I should see "Phone: 1234567890"
  And I should see "Date: January 05, 2019"
  And I should see "Time: Evening"
  And I should see "Vehicle: 1600 make1 model1"
  And I should see "VIN: 12345678901234567"
  And I should see "Reason: abc"
  
  Scenario: Search for appointments with a specific email adress
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the 'advanced search' page
  Then I should see a search form with an 'Email' text field
  When I enter "email3@gmail.com"
  And I click the 'Search' button
  Then I should see all of the attributes for the appointment with the id of '3' listed out
  
  Scenario: Search for appointments with a specific after and before date
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the 'advanced search' page
  Then I should see a search form with an 'After date' and 'Before date' date field
  When I select "01/06/2019" for the 'After date'
  And I select "01/20/2019" for the 'Before date'
  And I click the 'Search' button
  Then I should see all of the attributes for the appointments with ids of '3' and '4' listed out
  
  Scenario: Search for appointments with a specific time
  Given "test@gmail.com" is logged in using password "test1234"
  Given I am on the 'advanced search' page
  Then I should see a search form with a 'Time' text field
  When I select "Evening"
  And I click the 'Search' button
  Then I should see all of the attributes for the appointments with ids of '1' and '3' listed out