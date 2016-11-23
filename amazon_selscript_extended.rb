require 'selenium-webdriver'
#require 'pry'

driver = Selenium::WebDriver.for :chrome

driver.get 'http://amazon.com'

wait = Selenium::WebDriver::Wait.new(:timeout => 5)

driver.find_element(id: 'twotabsearchtextbox').send_keys("Eloquent Ruby\n")

wait.until { driver.find_element(id: 'atfResults') }

list = driver.find_element(id: 'atfResults').find_elements(tag_name: 'li')

list.each do |list_item|
  list_item.find_element(class: 'a-color-type')
end

span = results.find_elements(tag_name: 'span')
puts span[5].text

puts 'Done. Exiting.'
