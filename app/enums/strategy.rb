class Strategy < ClassyEnum::Base
  def self.enum
    self.name.split('::').last.underscore.to_sym
  end

  # @abstract
  def name
    self.class.to_s.demodulize.titleize
  end

  # @abstract
  def hint
    'Nobody knows how to do this.'
  end

  # @return true if current trick can be used for given question
  # @abstract
  def question_qualifies?(question)
    false
  end

end


# Default
class Strategy::Memorize < Strategy
  def name
    'Memorize'
  end

  def hint
    'Sometimes you gotta use the old-fashioned way.'
  end
end

# This will allow reload! in Rails console to work
# [Reference] https://github.com/beerlington/classy_enum/issues/9
Strategy::MultiplyBy5
Strategy::MultiplyBy25
Strategy::MultiplyBy125
Strategy::MultiplyBy11
Strategy::MultiplyBy12
Strategy::MultiplyLessThanCloseTo100
Strategy::MultiplyGreaterThanCloseTo100

Strategy::CompareFractions
Strategy::ReadRomanNumeral
Strategy::WriteRomanNumeral
Strategy::Square
Strategy::SquareNumberEndingIn5
Strategy::Cube
Strategy::RadixConversion

class Strategy::GCD < Strategy
  def name
    'Greatest Common Denominator'
  end

  def hint
    'Find the biggest of all divisors from the numbers given.'
  end
end

