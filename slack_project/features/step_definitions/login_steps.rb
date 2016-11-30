# background
Given(/^I am on the signin page$/) do
  @domain.visit
end

# incorrect domain
When(/^I enter an incorrect team domain name$/) do
  @domain.failed_login
end

Then(/^an incorrect team domain error should be thrown$/) do
  @domain.login_error
end

And(/^I should not be able to input any personal details$/) do
  @domain.confirm_on_page
end

# successful login
When(/^I enter my team domain name successfully$/) do
  @domain.login
end

Then(/^I should be asked to enter my personal login details$/) do
  @login.confirm_on_page
end

When(/^I enter correct user details$/) do
  @login.login
end

Then(/^I should be able to access my slack channel$/) do
  @channel.confirm_on_page
end

# unregistered email
When(/^I enter an unregistered but valid email$/) do
  @login.failed_login
end

Then(/^an unregistered email error will be thrown$/) do
  @login.login_error
end

And(/^I won't be able to login$/) do
  @login.confirm_on_page
end
