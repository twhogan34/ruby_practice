class LoginPage
  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto URLS['base_url']
  end

  def confirm_on_page
    Watir::Wait.until { @browser.text_field(id: 'email').present? }
  end

  def login
    @email = USER_DETAILS['email']
    @password = USER_DETAILS['password']
    @browser.text_field(id: 'email').send_keys @email
    @browser.text_field(id: 'password').send_keys "#{@password}\n"
  end

  def failed_login
    @invalid_email = USER_DETAILS['invalid_email']
    @browser.text_field(id: 'email').send_keys @invalid_email
    @browser.text_field(id: 'password').send_keys "password\n"
  end

  def login_error
    Watir::Wait.until { @browser.p(class: 'alert_error').visible? }
  end
end
