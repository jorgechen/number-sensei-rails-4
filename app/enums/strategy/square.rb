# Squares to memorize
class Strategy::Square < Strategy

  def name
    'Square'
  end

  def hint
    'Squares to memorize.'
  end

  LOWER_LIMIT = 1
  UPPER_LIMIT = 35

  def question_qualifies?(question)
    question.is_a? Question::Exponential and question.exponent == 2 and question.is_left_in_range?(LOWER_LIMIT, UPPER_LIMIT)
  end

  # @override
  def possible_questions
    Question::Exponential.squares_in_range(LOWER_LIMIT, UPPER_LIMIT)
  end


end