require 'watir'

describe 'Tumblr' do
  before :all do
    #logged_in?
    @browser = Watir::Browser.new :chrome
    @url = 'https://www.tumblr.com'
    @browser.goto "#{@url}/login"
  end

  it 'should log in with correct details' do
    @browser.input(id: 'signup_determine_email').send_keys EMAIL
    @browser.button(id: 'signup_forms_submit').click
    @browser.button(id: 'login-signin').click
    @browser.input(id: 'login-passwd').send_keys PASSWORD
    @browser.button(id: 'login-signin').click
    Watir::Wait.until { @browser.body(id: 'dashboard_index').exists? }
    expect(@browser.url).to eq "#{@url}/dashboard"
  end

  it 'should post a text post successfully' do
  end
end
