Feature: Browse puppies
  As a prospective puppy owner
  \I want to be able to browse the puppies on offer
  So that I can select a puppy to adopt

Scenario: View a selection of puppies available to adopt
  Given I am on the homepage
  Then I should be able to see up to 4 puppies at a time
  And I should see basic details about each one
  And buttons that allow me to see the other available puppies

Scenario: View all puppies available to adopt
  Given I am on the first page of the puppy list
  And I can see the first 4 puppies
  When I click on the page navigation buttons available to me
  Then I should be able to see the puppies on the other pages
  But I should not be able to navigate to the puppy list page I am already on

Scenario: View full details about an individual puppy
  Given I am on the homepage
  When I click the button for viewing further details for my chosen puppy
  Then I should be redirected to a new page showing full details of my chosen puppy

Scenario: Return to puppy list from an individual puppy's page
  Given I am on an individual puppy's page
  When I click the button for returning to the puppy list
  Then I should be redirected to the pupply list on the homepage

Scenario: Return to puppy list using logo button
  Given I am on any page on the website
  Then the logo should be present
  When I click the logo
  Then I should be redirected to the homepage
