Feature: Notes per weekday

  It could be interesting to see notes from the last 5 mondays, to see if any weekly patterns emerge.

  Scenario: Log two notes, a week apart, and see them both

    Given I am signed in as "Luna"
    And I logged a note 7 days ago with the following:
      """
      Head full of wrackspurts.
      """
    When I log a note for today with the following:
      """
      I feel fine and floaty today
      """
    And I go to the week day page for the current day of the week
    Then I should see both notes

  Scenario: You also see the note from the same day 5 weeks ago

    Given I am signed in as "Luna"
    And I logged a note 5 weeks ago with the following:
      """
      Attack of the nargles.
      """
    When I log a note for today with the following:
      """
      Wearing my spectrespecs.
      """
    And I go to the week day page for the current day of the week
    Then I should see both notes

  Scenario: Only the last five notes should be seen

    Given I am signed in as "Luna"
    And I logged a note 6 weeks ago with the following:
      """
      Old news by now!
      """
    When I log a note for today with the following:
      """
      Here's the latest!
      """
    And I go to the week day page for the current day of the week
    Then I should only see the latest note
