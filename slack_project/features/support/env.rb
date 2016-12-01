require 'pry'
require 'watir'
require 'yaml'

USER_DETAILS = YAML.load(File.open('./features/support/test_data/userdata.yml'))
URLS = YAML.load(File.open('./features/support/test_data/urls.yml'))

def logged_in?
  login unless @browser.url =~ /#{URLS['channel_url']}.*/
  @channel.confirm_on_page
end

def login
  if @browser.url.eql? URLS['signin_url']
    @domain.login
    @login.login
    @channel.confirm_on_page
  else
    @domain.visit
    login
  end 
end
