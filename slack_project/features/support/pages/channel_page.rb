class ChannelPage
  def initialize(browser)
    @browser = browser
  end

  def confirm_on_page
    Watir::Wait.until { @browser.div(id: 'team_menu').visible? }
  end
end
