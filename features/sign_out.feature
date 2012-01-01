Feature: Sign out

  Users should be able to sign out in order to sign in as someone else

  Scenario: Successful sign out

    User clicks the sign out link and is signed out

    Given I am signed in as "Charlie"
    When I sign out
    Then I should be signed out
