require 'pry'
require 'watir'
require 'yaml'

def userdetails(path = './features/support/userdata.yml')
  @details = YAML.load(File.open(path))
end

def signin_url
  'https://slack.com/signin'
end

def url(path = '/')
  'https://spartaglobal.slack.com' + path
end

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
