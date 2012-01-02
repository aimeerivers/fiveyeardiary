Feature: Change user settings

  Users should be able to update their settings and profile data.

  Scenario: Change settings

    Flitwick changes name to Filius

    Given I am signed in as "Flitwick"
    When I change my name to "Filius"
    Then "Filius" should be signed in
