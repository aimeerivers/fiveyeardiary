Feature: Notes per day of month

  It would be nice to see the notes logged on a particular day of the month

  Scenario: Log two notes, a month apart, and see them both

    Given I am signed in as "McGonagall"
    And I logged a note on the 1st day of last month with the following:
      """
      First years are such a delight.
      """
    When I log a note for the 1st day of this month with the following:
      """
      First years are getting annoying.
      """
    And I go to the day of month page for day 1
    Then I should see both notes
