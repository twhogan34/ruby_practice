Given(/^I am currently logged in$/) do
  App.login unless App.logged_in?
  App.channel_page.confirm_on_page
end

When(/^I log out$/) do
  App.channel_page.logout
end

Then(/^I should be logged out$/) do
  App.logout_page.confirm_on_page
end