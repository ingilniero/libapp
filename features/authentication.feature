Feature: Authentication feature

  Scenario: Succesfull reader login
  Given I am a guest
  And reader with "bob@reader.com" exists
  When I fill the login form with valid data for "bob@reader.com" reader
  Then should be logged in as "bob@reader.com" reader
