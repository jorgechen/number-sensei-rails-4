# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :official_challenge do
    upload "MyString"
    name "MyString"
    release_date "2013-08-11"
    grade_level 1
    difficulty 1
    event "MyString"
    category "MyString"
    location "MyString"
  end
end
