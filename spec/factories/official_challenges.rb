# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :official_challenge do
    upload ''
    name 'Typical High School Number Sense Test Fall 2013'
    release_date '2013-08-15'.to_date
    grade_level 5
    difficulty :normal
    event 'UIL State'
    association :category, factory: :challenge_category
    location 'Some Place, TX'
  end
end
