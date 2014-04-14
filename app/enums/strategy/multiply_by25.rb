class Strategy::MultiplyBy25 < Strategy
  def name
    'Multiply by 25'
  end

  def hint
    'Divide by 4.'
  end

  def question_qualifies?(question)
    question.is_a? Question::Multiplication and question.contains?(25)
  end

  # @override
  def possible_questions
    Question::Multiplication.any_matching(25)
  end

end
