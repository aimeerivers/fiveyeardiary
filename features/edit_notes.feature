Feature: Edit notes

  Users should be able to edit notes to make corrections

  Scenario: User changes the date of a note

    If they have logged a note for the wrong day they should be able to change it

    Given I am signed in as "Hagrid"
    And I log a note with the following:
      """
      Drank a bit too much ale again
      """
    Then I should see the note

    When I edit the note and change the date to yesterday
    Then I should see the note
    And the date should be set to yesterday
