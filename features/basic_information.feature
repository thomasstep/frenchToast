Feature: Basic information

  Scenario: Go to landing page
  Given I am on the home page
  Then I should see "3404 Bering Dr., Houston, TX 77057"

  Scenario: Go to about us page
  Given I am on the about us page
  Then I should see "Since 1979"

  Scenario: Go to schedule page
  Given I am on the schedule page
  Then I should see "We'll never share your email with anyone else."

  Scenario: Go to services offered page
  Given I am on the services page
  Then I should see "Drivetrain and Suspension"
