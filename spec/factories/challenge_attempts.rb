# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :challenge_attempt do
    challenge nil
    user nil
    correct 1
    incorrect 1
    skipped 1
    total 1
  end
end
