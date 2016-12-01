class LogoutPage < Generic

  def visit
    @browser.goto URLS['logout_url']
  end

  def confirm_on_page
    @browser.a(text: 'Sign back in').wait_until_present(10)
  end
end
