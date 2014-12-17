require 'byebug'

spec_folder = File.dirname(__FILE__)
root_folder = File.dirname(spec_folder)
app_folder = File.join(root_folder, 'lib', '*.rb')
Dir[app_folder].each { |file| require file }

RSpec.configure do |config|
end
