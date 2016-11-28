Given(/^I am on the Google homepage$/) do
  require 'watir'
  @browser = Watir::Browser.new :chrome
  @browser.goto('google.co.uk')
end

When(/^I search for "(.+)"$/) do |search_item|
  @browser.text_field(title: 'Search').when_present.set("#{search_item}\n")
end

Then(/^I should see "(.+)" from the Google search results$/) do |search_item|
  @browser.a(text: search_item).wait_until_present
  @browser.close
end
