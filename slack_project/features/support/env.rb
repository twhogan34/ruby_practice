require 'pry'
require 'watir'
require 'yaml'
require './features/support/pages/generic.rb'

USER_DETAILS = YAML.load(File.open('./features/support/test_data/userdata.yml'))
URLS = YAML.load(File.open('./features/support/test_data/urls.yml'))
