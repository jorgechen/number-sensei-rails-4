require 'sylvan_rails/knav_util'
KnavUtil.print_with_padding 'Tricks'

questions = Question.all

# createt individual tricks
Strategy.enum_options.each do |s|
  t = Trick.where(strategy: s.enum).first_or_create!
  puts "Finding questions for trick \t #{t.name} (#{t.to_s})"

  questions.find_each do |q|
    if t.question_qualifies? q
      q.tricks << t rescue nil # ignore if relationship already exists
    end
  end

end