# background
Given(/^I am logged in and the side navbar is visible$/) do
  login
  expect(@browser.header(id: 'client_header').visible?).to eq true
end
