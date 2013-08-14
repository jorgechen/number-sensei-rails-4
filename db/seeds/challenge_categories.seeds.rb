#KnavUtil.print_with_padding 'seeding ChallengeCategory'

[
    'Number Sense',
    'Mathematics',
    'Calculator',
    'Science',
    'Computer Science',
].each do |c|
  challenge_category = ChallengeCategory.create!(name: c)
  puts challenge_category.inspect
end


