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
    'No hints!'
  end

  # @return true if current trick can be used for given question
  # @abstract
  def question_qualifies?(question)
    false
  end

  # Returns a list of questions that is much smaller than Question.all because iterating through all questions in the DB takes longer than George in the shower.
  # @return pool of possible questions
  # @abstract
  def possible_questions
    []
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

# List of all tricks we've implemented
# Note: this will allow reload! in Rails console to work
# [Reference] https://github.com/beerlington/classy_enum/issues/9

Strategy::BumpUp
Strategy::CompareFractions
Strategy::Cube
Strategy::Divisibility
Strategy::Factorial
Strategy::HigherPowers
Strategy::Liof
Strategy::MultiplicationTable
Strategy::MultiplyBy5
Strategy::MultiplyBy11
Strategy::MultiplyBy12
Strategy::MultiplyBy25
Strategy::MultiplyBy125
Strategy::MultiplyGreaterThanCloseTo100
Strategy::MultiplyLessThanCloseTo100
Strategy::OrderOfOperations
Strategy::PrimeNumber
Strategy::RadixConversion
Strategy::ReadRomanNumeral
Strategy::Square
Strategy::SquareNumberCloseTo50
Strategy::SquareNumberCloseTo100
Strategy::SquareNumberEndingIn5
Strategy::UnitsOfMeasurement
Strategy::WriteRomanNumeral



class Strategy::GCD < Strategy
  def name
    'Greatest Common Denominator'
  end

  def hint
    'Find the biggest of all divisors from the numbers given.'
  end
end

