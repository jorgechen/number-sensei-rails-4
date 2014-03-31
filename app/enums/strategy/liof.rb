class Strategy::Liof < Strategy
  def name
    'LIOF'
  end

  def hint
    'Last Inside Outside First'
  end

  LOWER_LIMIT = 13
  UPPER_LIMIT = 99

  #@override
  def question_qualifies?(question)
    question.is_a? Question::Multiplication and question.is_in_range?(LOWER_LIMIT, UPPER_LIMIT)
  end

  #@override
  def possible_questions
    Question::Multiplication.all
  end

end