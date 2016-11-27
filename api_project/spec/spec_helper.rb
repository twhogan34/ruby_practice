require 'rspec'
require 'HTTParty'
#require 'pry'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

def url(path='/')
  'http://lacedeamon.spartaglobal.com/todos' + path
end

# unused wipe method
=begin
def wipe
  HTTParty.get(url).each do |todo|
    HTTParty.delete(url('/') + todo['id'].to_s)
    puts "wiping #{todo['title']}"
  end
end
=end

class HTTParty::Response < Object
  def check(title, code, message)
    arr = []
    arr << self['title']
    arr << self.code
    arr << self.message
    return arr
  end
end

#Test Data

DETAILS = {
  title: 'hello',
  due: '2010-09-09'
}

BAD_DETAILS = {
  title: 'hello'
}

WORSE_DETAILS = {
  due: '2010-09-09'
}

PUT_CHANGES = {
  title: 'changed',
  due: '2005-01-01'
}

PATCH_CHANGES = {
  title: 'new',
  due: '2005-01-01'
}

BAD_DATE = {
  title: 'new',
  due: '01-01-2001' 
}
