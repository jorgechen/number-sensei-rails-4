class Strategy < ClassyEnum::Base

  def name
    self.class.to_s.demodulize.titleize
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
end


class Strategy::GCD < Strategy
  def name
    'Greatest Common Denominator'
  end
end


class Strategy::MultiplyBy5 < Strategy
  def name
    'Multiply by 5'
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
end

