Feature: Log a note for the day

  Each day of the year, a user may log a note about what happened that day.
  They can also log notes for previous days, so as to catch up.
  They cannot log notes for future days.

  Scenario: User logs a note for today

    Normal situation: User comes in and logs a note.

    Given I am signed in as "Dean"
    When I log a note for today with the following:
      """
      Today i put a West Ham picture on the wall.
      """
    And I view the calendar for today
    Then I should see the note

  Scenario: User must be signed in to log and view notes

    All notes are protected so you must be signed in to add or view them.

    Given I am not signed in
    When I try to log a note
    Then I should see that I must be signed in
    When I try to view the calendar for today
    Then I should see that I must be signed in
