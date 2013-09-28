#TODO fix problem where unique validation of questions is failing
# for example, problem:
#>> Question.first.plain_text
#"11 * 5"
#>> Question.where(plain_text: "11 * 5")
#Question Load (0.9ms)  SELECT "questions".* FROM "questions" WHERE "questions"."plain_text" = '11 * 5'
##<ActiveRecord::Relation []>
#TODO then combine this file with questions.seeds.rb

data = YAML::load_file(File.join(Rails.root, 'db', 'seeds', "questions.#{Rails.env}.yml"))

if (list = data[:arabic_to_roman_numeral])
  puts 'Arabic to Roman Numerals'
  list.each do |h|
    Barracks.build_arabic_to_roman_numeral(h[:lower], h[:upper])
  end
end
