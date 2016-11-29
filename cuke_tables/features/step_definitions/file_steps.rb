require 'pry'

Given(/^these users:$/) do |table|
#  @table = table
#  binding.pry
#  @table.class
#  @table.raw
end

Given(/^I have (\d+) in my account$/) do |balance|
  puts balance
end

And(/^I withdraw (\d+)$/) do |withdrawal|
  puts withdrawal
end

Then(/^I should have (\d+) left in my account$/) do |remaining|
  puts remaining
end

When(/^I choose to show my list$/) do
end

Then(/^the following should be returned:$/) do |list|
  puts list
end
