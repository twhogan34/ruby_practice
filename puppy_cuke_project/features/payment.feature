Feature: Payment
  As a prospective puppy owner
  \I should be able to pay for the puppies and extra I want to purchase
  So that I can own my puppies!

Scenario: Input payment detials
  Given I am on the payment details page
  Then I should be able to input valid personal details in correctly labelled fields
  And select my preferred method of payment

Scenario: Make payment
  Given I am on the payment details page
  When I select the button for placing an order
  Then I should be able to adopt my puppies!
