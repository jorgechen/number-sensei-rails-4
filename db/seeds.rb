require 'sylvan_rails/knav_util'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
KnavUtil.print_with_padding 'Roles'
YAML.load(ENV['ROLES']).each do |role|
  Role.first_or_create!(name: role)
  puts 'role: ' << role
end

# Seed admin user
admin = User.new name: ENV['ADMIN_NAME'], email: ENV['ADMIN_EMAIL']
admin.password = ENV['ADMIN_PASSWORD']
admin.password_confirmation = ENV['ADMIN_PASSWORD']
admin.save
