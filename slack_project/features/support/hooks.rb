Before do
  @browser = Watir::Browser.new :chrome
  userdetails
  @domain = @details['domain']
  @invalid_domain = @details['invalid_domain']
  @email = @details['email']
  @password = @details['password']
  @invalid_email = @details['invalid_email']
end

Before('@login') do
  @browser.goto signin_url
end

Before('@online_status') do
  login
end
