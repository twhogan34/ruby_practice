Given(/^I am currently logged in$/) do
  logged_in?
end

When(/^I log out$/) do
  @channel.logout
end

Then(/^I should be logged out$/) do
  @logout.confirm_on_page
end