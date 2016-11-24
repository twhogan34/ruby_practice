require 'watir'

describe 'Tumblr' do
  include SecureRandom
  before :all do
    @browser = Watir::Browser.new :chrome
    @url = 'https://www.tumblr.com'
    @browser.goto "#{@url}/login"
    Watir::Wait.until { @browser.div(class: 'dash_b_form').exists? }
  
    login
  end

  before :each do
    if logged_in?
      @browser.goto "#{@url}/dashboard"
    else
      login
    end
  end

  it 'should log in with correct details' do
    expect(@browser.url).to eq "#{@url}/dashboard"
  end

  it 'should log out successfully' do
    expect(@browser.url).to eq "#{@url}/dashboard" rescue 'You are not logged in'
    logout
    expect(@browser.url).to eq "#{@url}/login"
  end

  it 'should post a text post successfully' do
    rand_title = SecureRandom::uuid
    rand_text = SecureRandom::uuid
    expect(@browser.url).to eq "#{@url}/dashboard" rescue 'You are not logged in'
    @browser.goto "#{@url}/new/text"
    @browser.div(class: 'editor-plaintext').send_keys rand_title
    @browser.div(class: 'editor-richtext').send_keys rand_text
    @browser.button(class: 'create_post_button').click
    sleep 2
    expect(@browser.url).to eq "#{@url}/dashboard"
    @browser.goto "#{@url}/blog/pinkmilkshakerebel"
    expect(@browser.ol(id: 'posts').lis[1].div(class: 'post_title').text).to eq rand_title
    expect(@browser.ol(id: 'posts').lis[1].div(class: 'post_body').text).to eq rand_text
  end
end
