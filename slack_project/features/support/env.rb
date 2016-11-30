require 'pry'
require 'watir'
require 'yaml'

USER_DETAILS = YAML.load(File.open('./features/support/test_data/userdata.yml'))
URLS = YAML.load(File.open('./features/support/test_data/urls.yml'))

=begin
def login
  if @browser.url.eql? signin_url
    @browser.text_field(id: 'domain').send_keys "#{@domain}\n"
    Watir::Wait.until { @browser.url.eql? url }
    @browser.text_field(id: 'email').send_keys @email
    @browser.text_field(id: 'password').send_keys "#{@password}\n"
    Watir::Wait.until { @browser.url.include? '/messages' }
  else
    @browser.goto signin_url
  end 
end
=end
