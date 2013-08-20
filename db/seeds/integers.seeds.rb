KnavUtil.print_with_padding 'IntegerNumber'

(-100..100).each do |i|
  IntegerNumber.create value: i
end