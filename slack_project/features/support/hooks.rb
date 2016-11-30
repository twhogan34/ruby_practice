Before('@login') do
  @browser = Watir::Browser.new :chrome
  @domain = DomainPage.new(@browser)
  @login = LoginPage.new(@browser)
  @channel = ChannelPage.new(@browser)
end
=begin
Before('@online_status') do
  login
end
=end

After('@login') do
  @browser.close
end

at_exit do
  @browser.close
end
