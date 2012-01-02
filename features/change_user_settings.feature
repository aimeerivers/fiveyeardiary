Feature: Change user settings

  Users should be able to update their settings and profile data.

  Scenario: Change profile

    Flitwick changes name to Filius

    Given I am signed in as "Flitwick"
    When I change my name to "Filius"
    Then "Filius" should be signed in

  Scenario: Change settings

    Fleur changes time zone to Central European Time

    Given I am signed in as "Fleur"
    When I change my time zone to "Paris"
    Then I should use the app in Central European Time
