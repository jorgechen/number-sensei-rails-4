class Strategy::SquareNumberCloseTo50 < Strategy
  def name
    'Square a Number Between 40 and 50'
  end

  def hint
    'Use the difference from 50.'
  end

  LOWER_LIMIT = 40
  UPPER_LIMIT = 60

  # @override
  def question_qualifies?(question)
    if question.is_a? Question::Multiplication
      a = question.left.to_i
      b = question.right.to_i
      if a == b and LOWER_LIMIT < a and a < UPPER_LIMIT
        return true
      end
    elsif question.is_a? Question::Exponential
      exponent = question.exponent.to_i
      base = question.base.to_i
      if exponent == 2 and LOWER_LIMIT < base and base < UPPER_LIMIT
        return true
      end
    end
    false
  end

  # @override
  def possible_questions
    Question.where('type=? or type=?', Question::Multiplication, Question::Exponential)
  end

end