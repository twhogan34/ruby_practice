# background
Given(/^I am on the signin page$/) do
  Watir::Wait.until { @browser.url.eql? signin_url }
end

# incorrect domain
When(/^I enter an incorrect team domain name$/) do
  @browser.text_field(id: 'domain').send_keys "#{@invalid_domain}\n"
end

Then(/^an incorrect team domain error should be thrown$/) do
  @browser.p(class: 'alert_error').visible?
end

And(/^I should not be able to input any personal details$/) do
  @browser.url.eql? signin_url
end

# successful login
When(/^I enter my team domain name successfully$/) do
  @browser.text_field(id: 'domain').send_keys "#{@domain}\n"
end

Then(/^I should be asked to enter my personal login details$/) do
  Watir::Wait.until { @browser.url.eql? url }
end

When(/^I enter correct user details$/) do
  @browser.text_field(id: 'email').send_keys @email
  @browser.text_field(id: 'password').send_keys "#{@password}\n"
end

Then(/^I should be able to access my slack channel$/) do
  Watir::Wait.until { @browser.url.include? '/messages' }
end

# unregistered email
When(/^I enter an unregistered but valid email$/) do
  @browser.text_field(id: 'email').send_keys @invalid_email
  @browser.text_field(id: 'password').send_keys "password\n"
end

Then(/^an unregistered email error will be thrown$/) do
  Watir::Wait.until { @browser.p(class: 'alert_error').visible? }
end

And(/^I won't be able to login$/) do
  Watir::Wait.until { @browser.url.eql? url }
end
