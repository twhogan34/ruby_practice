require 'watir'

describe 'Tumblr' do
  before :all do
    #logged_in?
    @browser = Watir::Browser.new :chrome
    @url = 'https://www.tumblr.com/login'
    @browser.goto @url
    @url = 'https://www.tumblr.com/login'

    @redirect_url = 'https://login.yahoo.com/config/login?.done=https%3A%2F%2Fapi.login.yahoo.com%2Foauth2%2Frequest_auth%3Fresponse_type%3Dcode%26redirect_uri%3Dhttps%253A%252F%252Fwww.tumblr.com%252Fopenid%252Fconnect%26client_id%3Ddj0yJmk9eDczSEtQeDc5WG9pJmQ9WVdrOVJUSm9aVmxVTjJVbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD01Yg--%26nonce%3D715affb9ad9d879eeaecda615fd0cc1b%26state%3D5ba515af45dec9209fd2545d41c61a1e%26scope%3Dopenid%2520sdpp-w%26.scrumb%3D0&.src=tumblr&.pd=c%3DRg.cJXHJGc1lYEe0TWrQSBHXYGdU8eYc4Q5q%26ockey%3Ddj0yJmk9eDczSEtQeDc5WG9pJmQ9WVdrOVJUSm9aVmxVTjJVbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD01Yg--&.crumb=EtHwjpf23V2&redirect_uri=https%3A%2F%2Fwww.tumblr.com%2Fopenid%2Fconnect&state=5ba515af45dec9209fd2545d41c61a1e&login_hint=thogan%40spartaglobal.co#_=_'
    @dashboard = 'https://www.tumblr.com/dashboard'
  end

  it 'should log in with correct details' do
    @browser.form(id: 'signup_form').input(id: 'signup_determine_email').send_keys EMAIL
    @browser.button(id: 'signup_forms_submit').click
    @browser.should redirect_to(@redirect_url)
    @browser.button(id: 'login-signin').click
    @browser.input(id: 'login-passwd').send_keys PASSWORD
    @browser.button(id: 'login-signin').click
    expect(@browser.url).to include 'dashboard'
  end

  it 'should post a text post successfully' do
  end
end
