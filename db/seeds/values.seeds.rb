KnavUtil.print_with_padding 'Constants'

# number constants
[
    # Pi
    {
        value: 3.1415926535897932384626433832795,
        plain_text: 'pi',
        html:  '&pi;',
        name:  'pi'
    },
    # Euler's number
    {
        value: 2.7182818284590452353602874713527,
        plain_text: 'e',
        html:  'e',
        name:  "Euler's number",
    },
    # golden ratio
    {
        value: 1.61803398875,
        plain_text: 'phi',
        html:  '&phi;',
        name:  'golden ratio',
    },
].each do |hash|
  c = Constant.new(hash)
  puts c.inspect
  c.save
end

########################################################################
KnavUtil.print_with_padding 'IntegerNumber'

(-100..100).each do |i|
  IntegerNumber.create value: i
end

########################################################################
KnavUtil.print_with_padding 'Fraction'

(-10..20).each do |numerator|
  (1...30).each do |denominator|
    Fraction.create numerator: numerator, denominator: denominator
  end
end
