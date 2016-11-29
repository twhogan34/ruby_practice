@login
Feature: Login

Background:
  Given I am on the signin page

@incorrect_domain
Scenario: Incorrect team domain
  When I enter an incorrect team domain name
  Then an incorrect team domain error should be thrown
  And I should not be able to input any personal details

@successful_login
Scenario: Successful login
  When I enter my team domain name successfully
  Then I should be asked to enter my personal login details
  When I enter correct user details
  Then I should be able to access my slack channel

@unregistered
Scenario: Unregistered email
  When I enter my team domain name successfully
  Then I should be asked to enter my personal login details
  When I enter an unregistered but valid email
  Then an unregistered email error will be thrown
  And I won't be able to login

@manual
Scenario Outline: Incorrect logins
  When I enter my team domain name successfully
  Then I should be asked to enter my personal login details
  When I enter the following details:
    | email                  | password |
    | hello                  | password |
    | thogan@spartaglobal.co | password |
    |                        | password |
    |                        |          |
  Then an error will be thrown and I won't be able to login
