# background
Given(/^I am logged in and I am able to type commands in the text field$/) do
  App.logged_in?
  App.slackbot.visit
  App.slackbot.confirm_on_page
end

# activity monitor active
When(/^the activity monitor is set to active$/) do
  
end

Then(/^my activity status should be active$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

# dnd off
When(/^do not disturb mode is set to off$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^do not disturb mode should be off$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

#activity monitor away
When(/^the activity monitor is set to away$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^my activity status should be away$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

# dnd on
When(/^do not disturb mode is set to on$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^do not disturb mode should be on$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
