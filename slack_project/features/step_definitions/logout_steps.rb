Given(/^I am currently logged in$/) do
  App.logged_in?
end

When(/^I log out$/) do
  App.channel_page.logout
end

Then(/^I should be logged out$/) do
  App.logout_page.confirm_on_page
end