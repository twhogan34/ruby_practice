Feature: Adopt puppies
  As a prospective puppy owner
  \I want to be able to adopt my chosen puppies
  So that I can own puppies

Scenario: Select a puppy to adopt
  Given I am on the individual puppy page for the puppy I want to adopt
  When I click the adopt button
  Then I should be redirected to the litter page
  And the puppy I've selected to adopt should be visible on the page

Scenario: Adopt my chosen puppy/puppies
  Given I am on the litter page
  And I am happy with my choice of puppies and extras
  When I click the adopt puppies button
  Then I should be redirected to the payment details page

Scenario: Adopt another puppy
  Given I am on the litter page
  When I click the button for adopting another puppy
  Then I should be redirected to the puppy list on the homepage
  And my litter should be stored in its current state

Scenario: Cancel adoption
  Given I am on the litter page
  When I click on the button for changing my mind
  Then I should see a dialog box asking me to confirm my decision
  When I click the button to confirm my decision
  Then I should be redirected to the puppy list on the homepage
  And my current litter should be cleared

Scenario: Cancel adoption then change my mind again
  Given I am on the litter page
  When I click on the button for changing my mind
  Then I should see a dialog box asking me to confirm my decision
  When I click the button to cancel my decision
  Then I should be returned to my litter page
  And my current litter should be unchanged