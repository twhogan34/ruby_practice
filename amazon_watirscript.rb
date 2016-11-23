require 'watir'

browser = Watir::Browser.new :chrome

browser.goto 'http://amazon.com'

browser.input(id: 'twotabsearchtextbox').send_keys "Eloquent Ruby\n"  

price = browser.div(id: 'resultsCol').li(id: 'result_0').span(class: 'a-color-base')
sign = price.sup(class: 'sx-price-currency').text
dollars = price.span(class: 'sx-price-whole').text
cents = price.sup(class: 'sx-price-fractional').text

puts "#{sign}#{dollars}.#{cents}"

puts 'Done. Ending.'