class Strategy::Factorial < Strategy
  def name
    'Factorial'
  end

  def hint
    ''
  end

  LOWER_LIMIT = 0
  UPPER_LIMIT = 6

  # @override
  def question_qualifies?(question)
    question.is_a? Question::Factorial and question.is_any_in_range?(LOWER_LIMIT, UPPER_LIMIT)
  end

  # @override
  def possible_questions
    Question::Factorial.all
  end

end
