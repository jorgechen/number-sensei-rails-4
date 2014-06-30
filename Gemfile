source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.0'

# assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'figaro'
gem 'haml-rails'

gem 'simple_form'
gem 'thin'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms => [:mri_19, :rbx]
  gem 'guard-bundler'
  gem 'guard-cucumber'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'html2haml'
  gem 'hub', :require => nil
  gem 'quiet_assets'
  gem 'rb-fchange', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-inotify', :require => false
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
end


# utility, tweaks
gem 'hirb'

# databases
gem 'pg'

# database visualizer
#gem 'rails-erd' # enable when we want to generate a ERD diagram with visualize_schema.sh

# authentication
gem 'devise', '>= 3.0.0'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-twitter'
gem 'omniauth-facebook'

# authorization
gem 'cancan'
#gem 'cancan_strong_parameters'
gem 'rolify'

# analytics
gem 'google-analytics-rails', :group => [:development, :production]

# seed data
gem 'seedbank', '0.3.0.pre2'

# file storage
gem 'carrierwave'
gem 'rmagick'

#cloud service, for Amazon S3
gem 'fog'

# data structures
gem 'enumerize'
gem 'classy_enum'
gem 'closure_tree'
gem 'ranked-model'

# base conversion, also useful for unique IDs and checksums
gem 'radix'

# Roman Numerals, my favorite hmmm
gem 'roman-numerals'

# background jobs
gem 'sidekiq'
gem 'sinatra', require: false # for Sidekiq's web UI
gem 'slim' # for Sidekiq's web UI

# Gamification
gem 'merit', '~> 2.1.1'
