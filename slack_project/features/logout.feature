@logout
Feature: Logout
  This feature will test the logout functionality of the website

Background:
  Given I am currently logged in

Scenario: Logging out
  When I log out
  Then I should be logged out
