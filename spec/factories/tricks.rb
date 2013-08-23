# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trick do
    strategy "MyString"
    name "MyString"
  end
end
