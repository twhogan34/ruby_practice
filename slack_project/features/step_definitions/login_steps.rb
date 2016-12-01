# background
Given(/^I am on the signin page$/) do
  App.domain_page.visit
end

# incorrect domain
When(/^I enter an incorrect team domain name$/) do
  App.domain_page.failed_login
end

Then(/^an incorrect team domain error should be thrown$/) do
  App.domain_page.login_error
end

And(/^I should not be able to input any personal details$/) do
  App.domain_page.confirm_on_page
end

# successful login
When(/^I enter my team domain name successfully$/) do
  App.domain_page.login
end

Then(/^I should be asked to enter my personal login details$/) do
  App.login_page.confirm_on_page
end

When(/^I enter correct user details$/) do
  App.login_page.login
end

Then(/^I should be able to access my slack channel$/) do
  App.channel_page.confirm_on_page
end

# unregistered email
When(/^I enter an unregistered but valid email$/) do
  App.login_page.failed_login
end

Then(/^an unregistered email error will be thrown$/) do
  App.login_page.login_error
end

And(/^I won't be able to login$/) do
  App.login_page.confirm_on_page
end
