class Strategy::Divisibility < Strategy
  def name
    'Divisibility'
  end

  def hint
    ''
  end

  LOWER_LIMIT = 2
  UPPER_LIMIT = 12

  # @override
  def question_qualifies?(question)
    question.is_a? Question::Factorial and question.is_any_in_range?(LOWER_LIMIT, UPPER_LIMIT)
  end

  # @override
  def possible_questions
    Question::Division.divisor_in_range(LOWER_LIMIT, UPPER_LIMIT)
  end

end
