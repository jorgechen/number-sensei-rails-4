# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'George Chen'
    email 'sylvan@knave.com'
    provider 'twitter'
    uid ''
  end
end
