# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :challenge_question_pairing do
    challenge nil
    question nil
    numbering 1
  end
end
