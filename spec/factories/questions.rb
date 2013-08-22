# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    expression nil
    answer nil
    html "MyString"
    plain_text "MyString"
    answer_html "MyString"
    answer_plain_text "MyString"
  end
end
