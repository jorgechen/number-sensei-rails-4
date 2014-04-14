class Strategy::MultiplyLessThanCloseTo100 < Strategy
  def name
    'Multiply Numbers a Little Under 100'
  end

  def hint
    ''
  end

  LOWER_LIMIT = 91
  UPPER_LIMIT = 99

  #@param q [Question::Multiplication]
  def question_qualifies?(question)
    question.is_a? Question::Multiplication and question.is_both_in_range?(LOWER_LIMIT, UPPER_LIMIT)
  end

  # @override
  def possible_questions
    Question::Multiplication.all_in_range(LOWER_LIMIT, UPPER_LIMIT)
  end

end
