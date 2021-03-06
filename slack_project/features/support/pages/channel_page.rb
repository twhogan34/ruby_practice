class ChannelPage < Generic

  def visit
    @browser.goto URLS['channel_url']
  end

  def confirm_on_page
    Watir::Wait.until { @browser.div(id: 'presence_container').visible? }
  end

  def logout
    @browser.i(id: 'presence').click
    @browser.li(id: 'logout').when_present.click
    App.logout_page.confirm_on_page
  end

# activity monitor methods
  def set_activity_monitor
    @browser.i(id: 'presence').click
  end
end
