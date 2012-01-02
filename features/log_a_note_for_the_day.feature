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
    And I view the diary for today
    Then I should see the note

  Scenario: User must be signed in to log and view notes

    All notes are protected so you must be signed in to add or view them.

    Given I am not signed in
    When I try to log a note
    Then I should see that I must be signed in
    When I try to view the diary for today
    Then I should see that I must be signed in

  Scenario: User can log a note for a previous day

    You can 'catch up' on previous days

    Given I am signed in as "Dean"
    When I log a note for yesterday with the following:
      """
      I arrived at Hogwarts!
      """
    And I view the diary for yesterday
    Then I should see the note

  Scenario: User cannot log a note for tomorrow

    Notes cannot be added in advance.

    Given I am signed in as "Dean"
    When I try to log a note for tomorrow with the following:
      """
      I predict that i will be eaten by a Grim
      """
    Then I should be told that I cannot log a note in the future

  Scenario: User cannot log a second note for the same day

    There should be only one note per day.

    Given I am signed in as "Dean"
    When I log a note for today with the following:
      """
      First note
      """
    And I try to log a note for today with the following:
      """
      Second note
      """
    Then I should be told that I cannot log two notes for the same day

  Scenario: Daily notes are unique per user

    Although Dean has made a note for today, Ernie has not.

    Given I am signed in as "Dean"
    When I log a note for today with the following:
      """
      Dean's note
      """

    When I am signed in as "Ernie"
    And I log a note for today with the following:
      """
      Ernie's note
      """
    And I view the diary for today
    Then I should see the note

  Scenario: The current day is determined according to your time zone

    Somebody in Nuku'alofa can write a note for the day they are in, which may well be tomorrow

    Given I am signed in as "Grawp"
    And I change my time zone to "Nuku'alofa"
    When I log a note with the following:
      """
      Greetings from the future!
      """
    Then I should see the note
