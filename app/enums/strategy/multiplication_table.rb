class Strategy::MultiplicationTable < Strategy
  def name
    'Multiplication Table'
  end

  def hint
    'Know it by heart!'
  end

  LOWER_LIMIT = 1
  UPPER_LIMIT = 12

  def question_qualifies?(question)
    question.is_a? Question::Multiplication and question.is_both_in_range?(LOWER_LIMIT, UPPER_LIMIT)
  end

  # @override
  def possible_questions
    Question::Multiplication.all
  end

end
