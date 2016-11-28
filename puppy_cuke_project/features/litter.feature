Feature: Litter functionality
  As a prospective puppy owner
  \I want to be able to manipulate my 'litter'
  So that I can select the right puppies and extras to purchase

Scenario: View my current litter
  Given I am on the litter page
  Then I should be able to see all the puppies and extras I have selected for adoption
  And I should be able to see the price per item
  And I should be able to see the overall price of my purchase
  And I should be able to see any additional products or services I might want to purchase and their prices

Scenario: Add extras to my purchase
  Given I am on the litter page
  And I have at least one puppy selected for adoption
  When I select the checkbox for an additional product or service
  Then the total price should be updated
  And the newly selected item should show as selected
  But the individual puppy price should remain the same
    