# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
NumberSenseiRails4::Application.initialize!

# Rails Console only
if defined?(Rails::Console)
  puts 'Automatically enabling Hirb... (in environment.rb)'
  Hirb.enable
end

# load class extensions
require 'sylvan_rails/string'

# Custom MIME type to be rendered by controllers
# Print format
Mime::Type.register "text/html", :print

