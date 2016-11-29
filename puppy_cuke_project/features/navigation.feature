Feature: Website navigation
  As a user of this puppy adoption website
  \I should be able to clearly navigate myself around the website
  So that I can quickly and easily find the information I seek

Scenario: Navigation bar
  Given I am on any page of the website
  Then the navigation bar should be present
  When I select any of the page on the navigation bar
  Then I should be redirected to the relevant page

Scenario: Return to puppy list using logo button
  Given I am on any page on the website
  Then the logo should be present
  When I click the logo
  Then I should be redirected to the homepage

Scenario: Homepage identification
  Given I am on the homepage of the website
  Then the title and company logo of the website should be clearly visible
