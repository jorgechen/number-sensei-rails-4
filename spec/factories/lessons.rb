# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson do
    name "MyString"
    numbering 1
    course nil
  end
end
