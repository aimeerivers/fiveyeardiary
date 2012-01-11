Feature: Notes per week

  It would be nice to see a week's worth of entries, like a traditional diary.

  Scenario: Log two notes and see them both on the week view page

    Note that this scenario won't work on a monday! :p

    Given I am signed in as "McGonnagal"
    And I logged a note 1 day ago with the following:
      """
      First years are such a nuisance.
      """
    When I log a note for today with the following:
      """
      The first years are learning to be better behaved
      """
    And I go to the week page for the current week
    Then I should see both notes
