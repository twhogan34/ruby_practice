class ChannelPage
  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto URLS['channel_url']
  end

  def confirm_on_page
    Watir::Wait.until { @browser.div(id: 'presence_container').visible? }
  end

  def logout
    @browser.i(id: 'presence').click
    @browser.li(id: 'logout').when_present.click
  end
end
