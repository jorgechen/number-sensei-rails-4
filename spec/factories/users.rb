# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Sylvan Knave'
    email 'info@habituallyamazed.com'
    provider 'twitter'
    uid 'abcdefg'
  end
end
