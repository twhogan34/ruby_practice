After('@successful_login') do
  App.channel_page.logout
end

at_exit do
  @@browser.close!
end
