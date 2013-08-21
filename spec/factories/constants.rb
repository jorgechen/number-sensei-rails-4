# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :constant do
    value 1.5
    plain "MyString"
    html "MyString"
  end
end
