########################################################################
KnavUtil.print_with_padding 'Multiplication of 2 Integers'

lower = 1
upper = 30

(lower...upper).each do |i|
  (1...50).each do |j|
    q = Question::Multiplication.build i, j
    q.save!
    puts "#{i},#{j} >>>>> #{q.plain_text}"
  end
end

