require 'sylvan_rails/knav_util'

KnavUtil.print_with_padding 'Tricks'

#TODO this is unnecessary if questions are not seeded

# Ensure all tricks exist, and they connect with all applicable questions.
Strategy.enum_options.each do |s|
  t = Trick.where(strategy: s.enum).first_or_create!

  #NOTE: Currently we automatically associate tricks upon creating a question
  ## associate pre-seeded questions with applicable tricks
  #questions = Question.all
  #puts "Finding questions for trick \t #{t.name} (#{t.to_s})"
  #questions.find_each do |q|
  #  if t.question_qualifies? q
  #    q.tricks << t rescue nil # ignore if relationship already exists
  #  end
  #end

end
