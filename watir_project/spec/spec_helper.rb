require 'rspec'
require 'watir'

EMAIL = 'thogan@spartaglobal.co'
PASSWORD = 'watirproject'

# Helper methods
def logged_in?
  @browser.body.class_name.include?('logged_in')
end

def logout
  @browser.goto "#{@url}/logout"
end

def login
  if @browser.url == "#{@url}/login"
    @browser.input(id: 'signup_determine_email').send_keys EMAIL
    @browser.button(id: 'signup_forms_submit').click
    @browser.button(id: 'login-signin').click
    @browser.input(id: 'login-passwd').send_keys PASSWORD
    @browser.button(id: 'login-signin').click
    Watir::Wait.until { @browser.body(id: 'dashboard_index').exists? }
  else
    @browser.goto "#{@url}/login"
    login
  end
end

def find_post
  @browser.lis(class: "post_container").each do |list_item|
    if list_item.attribute_value('data-pageable') == @id
      return true
    else
      return false
    end
  end
end

# Focus method
#RSpec.configure do |config|
#  config.filter_run :focus => true
#end

# Configure RSpec
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  # config.order = :random

  Kernel.srand config.seed
end
