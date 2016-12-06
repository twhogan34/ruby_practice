class Slackbot < Generic

  def visit
    @browser.goto URLS['slackbot_url']
  end

  def confirm_on_page
    Watir::Wait.until { @browser.span(id: 'im_title').text == 'slackbot' }
  end
end
