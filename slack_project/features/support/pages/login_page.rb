class LoginPage
  def initialize(browser, path = './features/support/userdata.yml')
    @browser = browser
    @details = YAML.load(File.open(path))
  end

  def visit(path = './features/support/urls.yml')
    @url = YAML.load(File.open(path))
    @browser.goto @url['base_url']
  end

  def confirm_on_page
    Watir::Wait.until { @browser.text_field(id: 'email').present? }
  end

  def login
    @email = @details['email']
    @password = @details['password']
    @browser.text_field(id: 'email').send_keys @email
    @browser.text_field(id: 'password').send_keys "#{@password}\n"
  end

  def failed_login
    @invalid_email = @details['invalid_email']
    @browser.text_field(id: 'email').send_keys @invalid_email
    @browser.text_field(id: 'password').send_keys "password\n"
  end

  def login_error
    Watir::Wait.until { @browser.p(class: 'alert_error').visible? }
  end
end
