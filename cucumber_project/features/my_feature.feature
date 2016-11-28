Feature: My First Feature

Scenario: Searching for something using Google
  Given I am on the Google homepage
  When I search for "Ruby"
  Then I should see "Ruby Programming Language" from the Google search results