require 'sylvan_rails/knav_util'

KnavUtil.print_with_padding 'Tricks'

# Ensure all tricks exist, and they connect with all applicable questions.
Strategy.enum_options.each do |s|
  t = Trick.where(strategy: s.enum).first_or_initialize

  if t.new_record? and t.save
    # NOTE: Currently we automatically associate tricks upon creating a question
    # associate pre-seeded questions with applicable tricks
    puts "Finding questions for trick \t #{t.name} (#{t.to_s})"
    Armory::assign_questions(t)
  end

end
