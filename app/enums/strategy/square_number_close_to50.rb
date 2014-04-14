class Strategy::SquareNumberCloseTo50 < Strategy
  def name
    'Square a Number Close to 50'
  end

  def hint
    'Use the difference from 50.'
  end

  LOWER_LIMIT = 41
  UPPER_LIMIT = 59

  # @override
  def question_qualifies?(question)
    if question.is_a? Question::Multiplication and question.is_both_in_range?(LOWER_LIMIT, UPPER_LIMIT)
      a = question.left.to_i
      b = question.right.to_i
      return true if a == b and a != 50

    elsif question.is_a? Question::Exponential
      exponent = question.exponent.to_i
      base = question.base.to_i
      return true if exponent == 2 and base != 50 and LOWER_LIMIT <= base and base <= UPPER_LIMIT

    end
    false
  end

  # @override
  def possible_questions
    Question::Multiplication.all_in_range(LOWER_LIMIT, UPPER_LIMIT) +
        Question::Exponential.squares_in_range(LOWER_LIMIT, UPPER_LIMIT)
  end

end