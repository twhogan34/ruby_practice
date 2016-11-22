require 'selenium-webdriver'
#require 'pry'

driver = Selenium::WebDriver.for :chrome

driver.get 'http://amazon.com'

sleep 2

driver.find_element(id: 'twotabsearchtextbox').send_keys("Eloquent Ruby\n")

sleep 2

span = driver.find_element(id: 'result_0').find_elements(tag_name: 'span')
puts span[5].text

puts 'Done. Exiting.'
