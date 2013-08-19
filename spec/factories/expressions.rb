# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expression do
    token "MyString"
    type ""
    parent_id 1
  end
end
