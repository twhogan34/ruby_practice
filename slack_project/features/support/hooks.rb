Before do
  @browser = Watir::Browser.new :chrome
  @domain = DomainPage.new(@browser)
  @login = LoginPage.new(@browser)
  @channel = ChannelPage.new(@browser)
  @logout = LogoutPage.new(@browser)
end

After do
  @browser.close
end

at_exit do
  @browser.close
end
