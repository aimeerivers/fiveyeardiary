Feature: Sign in

  Returning users should be able to sign in.

  Scenario: Successful sign in

    Existing user Alice can sign in again

    Given a user called "Alice"
    When I sign in as "Alice"
    Then "Alice" should be signed in
