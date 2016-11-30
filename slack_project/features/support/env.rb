require 'pry'
require 'watir'
require 'yaml'

def userdetails(path = './features/support/userdata.yml')
  @details = YAML.load(File.open(path))
end

def signin_url
  'https://slack.com/signin'
end

def url(path = '/')
  'https://spartaglobal.slack.com' + path
end
