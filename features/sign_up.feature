Feature: Sign up

  There should be the option to sign up with an email address and password

  Scenario: Successful sign up

    New users should be welcomed to the site

    Given I have chosen to sign up
    When I sign up with valid details
    Then I should be welcomed to the site
