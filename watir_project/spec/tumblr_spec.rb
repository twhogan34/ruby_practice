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
=begin
  it 'should log in with correct details' do
    expect(@browser.url).to eq "#{@url}/dashboard"
  end

  it 'should fail to log in with invalid email' do
    logout
    expect(@browser.url).to eq "#{@url}/login"
    @browser.input(id: 'signup_determine_email').send_keys 'hello'
    @browser.button(id: 'signup_forms_submit').click
    Watir::Wait.until { @browser.li(class: 'error').visible? }
    expect(@browser.li(class: 'error').text).to eq 'That\'s not a valid email address. Please try again.'
    5.times { @browser.input(id: 'signup_determine_email').send_keys :backspace }
  end

  it 'should fail to log in with invalid password' do
    logout
    expect(@browser.url).to eq "#{@url}/login"
    @browser.input(id: 'signup_determine_email').send_keys EMAIL
    @browser.button(id: 'signup_forms_submit').click
    @browser.button(id: 'login-signin').click
    @browser.input(id: 'login-passwd').send_keys 'hello'
    @browser.button(id: 'login-signin').click
    Watir::Wait.until { @browser.div(id: 'mbr-login-error').visible? }
    expect(@browser.div(id: 'mbr-login-error').text).to eq 'Invalid password. Please try again.'
  end

  it 'should log out successfully' do
    expect(@browser.url).to eq "#{@url}/dashboard"
    logout
    expect(@browser.url).to eq "#{@url}/login"
  end

  it 'should post a text post successfully' do
    rand_title = SecureRandom::uuid
    rand_text = SecureRandom::uuid

    expect(@browser.url).to eq "#{@url}/dashboard"
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
=end
  it 'should be able to delete a post' do
    @browser.goto "#{@url}/blog/pinkmilkshakerebel"
    title = @browser.ol(id: 'posts').lis[1].div(class: 'post_title')
    words = @browser.ol(id: 'posts').lis[1].div(class: 'post_body')

    @browser.ol(id: 'posts').lis[1].div(class: 'creator').click
    Watir::Wait.until { @browser.div(class: 'post_controls_inner').div(class: 'active').present? }
    @browser.ol(id: 'posts').ul(class: 'popover_inner').lis[1].click
    sleep 1
    @browser.button(class: 'blue').click
    sleep 1
    expect(@browser.title.object_id.exists?).to eq false
    expect(@browser.words.object_id.exists?).to eq false
  end

=begin
  it 'should be able to post an image' do
  end
=end

end

