class Strategy::SquareNumberEndingIn5 < Strategy
  def name
    'Square a Number Ending in 5'
  end

  def hint
    'Multiply first part by its increment, then write 25.'
  end

  LOWER_LIMIT = 1
  UPPER_LIMIT = 115

  # @override
  def question_qualifies?(question)
    if question.is_a? Question::Multiplication and question.is_both_in_range?(LOWER_LIMIT, UPPER_LIMIT)
      a = question.left
      b = question.right
      return true if a == b and a % 10 == 5

    elsif question.is_a? Question::Exponential
      exponent = question.exponent
      base = question.base
      return true if exponent == 2 and base % 10 == 5 and LOWER_LIMIT <= base and base <= UPPER_LIMIT

    end
    false
  end

  # @override
  def possible_questions
    Question.where('type=? or type=?', Question::Multiplication, Question::Exponential)
  end

end