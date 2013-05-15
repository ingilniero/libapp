Feature: Reader Registration

  To be register in the application, the reader goes to a register form, which consists only
  of email, password and confirm password fields and a button to submit the form.
  After the reader is logged in and is ready to work with the application.

  Scenario: Reader registers successfully via register form
    Given I am a guest
    When I fiil the register form with valid data
    Then  I should be registered in the application
    And I should be logged in

  Scenario: Reader tries to register with invalid data
    Given I am a guest
    When I fill the register form with invalid data
    Then I should see the register form again
    And I should not be registered in the application