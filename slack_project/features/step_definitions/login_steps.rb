# background
Given(/^I am on the signin page$/) do
  @browser = Watir::Browser.new :chrome
  @browser.goto 'https://slack.com/signin'
end

# And no previous login details have been stored

# incorrect domain
When(/^I enter an incorrect team domain name$/) do
  @browser.text_field(id: 'domain').send_keys "aeorijgio\n"
end

Then(/^an incorrect team domain error should be thrown$/) do
  @browser.p(class: 'alert_error').visible?
end

And(/^I should not be able to input any personal details$/) do
  @browser.url.eql? 'https://slack.com/signin'
end

# successful login
When(/^I enter my team domain name successfully$/) do
  @browser.text_field(id: 'domain').send_keys "spartaglobal\n"
end

Then(/^I should be asked to enter my personal login details$/) do
  @browser.url.eql? 'https://spartaglobal.slack.com/'
end

When(/^I enter correct user details$/) do
  @browser.text_field(id: 'email').send_keys 'thogan@spartaglobal.co'
# This step should fail as these are not my password details  
  @browser.text_field(id: 'password').send_keys password
end

Then(/^I should be able to access my slack channel$/) do
  @browser.div(id: 'team_menu').present? == true
end

# unregistered email
When(/^I enter an unregistered but valid email$/) do
  @browser.text_field(id: 'email').send_keys 'twhogan34@gmail.com'
  @browser.text_field(id: 'password').send_keys "XXX\n"
end

Then(/^an unregistered email error will be thrown$/) do
  @browser.p(class: 'alert_error').visible?
end

And(/^I won't be able to login$/) do
  @browser.url.eql? 'https://spartaglobal.slack.com/'
end
