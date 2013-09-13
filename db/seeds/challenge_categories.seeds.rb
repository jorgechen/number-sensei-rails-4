KnavUtil.print_with_padding 'ChallengeCategory'

[
    'Number Sense',
    'Mathematics',
    'Calculator',
    'Science',
    'Computer Science',
    'other',
].each do |c|
  challenge_category = ChallengeCategory.where(name: c).first_or_create
  puts challenge_category.inspect
end


