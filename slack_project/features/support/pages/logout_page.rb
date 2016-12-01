class LogoutPage < Generic

  def visit
    @browser.goto URLS['logout_url']
  end

  def confirm_on_page
    Watir::Wait.until { @browser.url.eql? URLS['logout_url'] }
  end
end
