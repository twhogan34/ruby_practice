class App
  attr_reader :browser

  @@browser = Watir::Browser.new :chrome

  def self.method_missing(method_name, *arguments, &block)
    @@pages ||= {}
    class_name = method_name.to_s.split('_').collect(&:capitalize).join
    @@pages[method_name] || @@pages[method_name] = Object.const_get(class_name).new(@@browser)
  end

  def self.close!
    @@browser.quit
  end

  def self.login
    if @@browser.url.eql? URLS['signin_url']
      self.domain_page.login
      self.login_page.login
      self.channel_page.confirm_on_page
    else
      self.domain_page.visit
      login
    end 
  end

  def self.logged_in?
    self.login unless @@browser.url == /URLS['channel_url'].*/
    self.channel_page.confirm_on_page
  end

  private_class_method :new
end
