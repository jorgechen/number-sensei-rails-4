# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
NumberSenseiRails4::Application.initialize!

# Rails Console only
if defined?(Rails::Console)
  puts 'Automatically enabling Hirb... (in environment.rb)'
  Hirb.enable
end
