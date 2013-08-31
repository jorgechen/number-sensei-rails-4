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


#require other files
#Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }


class Strategy::GCD < Strategy
  def name
    'Greatest Common Denominator'
  end

  def hint
    'Find the biggest of all divisors from the numbers given.'
  end
end


class Strategy::MultiplyBy5 < Strategy
  def name
    'Multiply by 5'
  end

  def hint
    'Divide by 2, then add 0 or 5.'
  end

  def question_qualifies?(q)
    if q.is_a? Question::Multiplication and q.expression.is_a? MultiplicationExpression and q.expression.has_a? 5
      true
    end
  end
end


class Strategy::MultiplyBy25 < Strategy
  def name
    'Multiply by 25'
  end

  def hint
    'Divide by 4, then add 0, 25, 50, or 75.'
  end
end

