class DomainPage < Generic

  def visit
    @browser.goto URLS['signin_url']
  end

  def confirm_on_page
    Watir::Wait.until { @browser.text_field(id: 'domain').present? }
  end

  def login
    @domain = USER_DETAILS['domain']
    @browser.text_field(id: 'domain').send_keys "#{@domain}\n"
  end

  def failed_login
    @invalid_domain = USER_DETAILS['invalid_domain']
    @browser.text_field(id: 'domain').send_keys "#{@invalid_domain}\n"
  end

  def login_error
    Watir::Wait.until { @browser.p(class: 'alert_error').visible? }
  end
end
