require 'selenium-webdriver'
#require 'pry'

driver = Selenium::WebDriver.for :chrome

driver.get 'http://google.com'

sleep 5

driver.find_element(id: 'lst-ib').send_keys("Hello There\n")

driver.find_elements(class: 'g').each do |link|
	puts link.find_element(tag_name: 'a').text
	puts '---'
	puts link.find_element(tag_name: 'a').attribute 'href'
	puts '---------------------------------'
end

puts 'Done. Exiting.'