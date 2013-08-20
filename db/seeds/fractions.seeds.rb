KnavUtil.print_with_padding 'Fraction'

(-10..20).each do |numerator|
  (1...30).each do |denominator|
    Fraction.create numerator: numerator, denominator: denominator
  end
end
