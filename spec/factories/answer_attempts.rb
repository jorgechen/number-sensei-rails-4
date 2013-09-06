# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer_attempt do
    challenge_attempt nil
    question nil
    result "MyString"
  end
end
