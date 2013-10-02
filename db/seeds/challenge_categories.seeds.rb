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
  if challenge_category.new_record?
    puts "added new category: #{challenge_category.inspect}"
  end

end


