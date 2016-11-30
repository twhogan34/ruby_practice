require 'pry'
require 'watir'
require 'yaml'

def password(path='.features/support/userdata.yml')
  file = YAML.load(File.open(path))
  return file['password']
end
