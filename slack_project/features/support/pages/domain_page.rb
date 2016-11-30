class DomainPage
  def initialize(browser, path = './features/support/userdata.yml')
    @browser = browser
    @details = YAML.load(File.open(path))
  end

  def visit(path = './features/support/urls.yml')
    @url = YAML.load(File.open(path))
    @browser.goto @url['signin_url']
  end

  def confirm_on_page
    Watir::Wait.until { @browser.text_field(id: 'domain').present? }
  end

  def login
    @domain = @details['domain']
    @browser.text_field(id: 'domain').send_keys "#{@domain}\n"
  end

  def failed_login
    @invalid_domain = @details['invalid_domain']
    @browser.text_field(id: 'domain').send_keys "#{@invalid_domain}\n"
  end

  def login_error
    Watir::Wait.until { @browser.p(class: 'alert_error').visible? }
  end
end
