class Strategy::SquareNumberCloseTo100 < Strategy
  def name
    'Square a Number Close to 100'
  end

  def hint
    'Use the difference from 100.'
  end

  LOWER_LIMIT = 90
  UPPER_LIMIT = 110

  # @override
  def question_qualifies?(question)
    if question.is_a? Question::Multiplication
      a = question.left.to_i
      b = question.right.to_i
      if  a == b and
          a != 100 and
          LOWER_LIMIT < a and
          a < UPPER_LIMIT
        return true
      end
    elsif question.is_a? Question::Exponential
      exponent = question.exponent.to_i
      base = question.base.to_i
      if  exponent == 2 and
          base != 100 and
          LOWER_LIMIT < base and
          base < UPPER_LIMIT
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