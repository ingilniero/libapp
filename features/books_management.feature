Feature: Edit and destroy books

  Only book owner can edit or destroy his books

  Scenario: Edit existent book by its owner
    Given I am the owner of "The Hamlet" book
    When I change "The Hamlet" book title to "Romeo and Juliet"
    Then book "The Hamlet" should not exist in database
    And book "Romeo and Juliet" should exist in database
    And I should see "Romeo and Juliet" book on library

  Scenario: Delete book
    Given I am the owner of "The Hamlet" book
    When I delete "The Hamlet" book
    Then book "The Hamlet" should not exist in database
    And I should not see "The Hamlet" book on library page

  Scenario: Try to edit book that reader doesn't own
    Given I am not the owner of "The Hamlet" book
    When I go to edit "The Hamlet" book page
    Then I should be redirected to access denied page
