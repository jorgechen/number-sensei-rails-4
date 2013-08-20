KnavUtil.print_with_padding 'ChallengeCategory'

[
    'Number Sense',
    'Mathematics',
    'Calculator',
    'Science',
    'Computer Science',
    'other',
].each do |c|
  challenge_category = ChallengeCategory.create!(name: c)
  puts challenge_category.inspect
end


