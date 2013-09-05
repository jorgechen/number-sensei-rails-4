class Strategy < ClassyEnum::Base

  def name
    self.class.to_s.demodulize.titleize
  end

  def hint
    'Nobody knows how to do this.'
  end

  def self.enum
    self.name.split('::').last.underscore.to_sym
  end

  # @return true if current trick can be used for given question
  # @abstract
  def question_qualifies?(question)
    false
  end
end


# Default
class Strategy::None < Strategy
  def hint
    'Good luck!'
  end
end

# This will allow reload! in Rails console to work
# [Reference] https://github.com/beerlington/classy_enum/issues/9
Strategy::MultiplyBy125
Strategy::CompareFractions
Strategy::ReadRomanNumeral

class Strategy::GCD < Strategy
  def name
    'Greatest Common Denominator'
  end

  def hint
    'Find the biggest of all divisors from the numbers given.'
  end
end

