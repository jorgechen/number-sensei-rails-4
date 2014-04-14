class Strategy::MultiplyBy12 < Strategy
  def name
    'Multiply by 12'
  end

  def hint
    'Double the number and add it to 10x the number.'
  end

  def question_qualifies?(question)
    question.is_a? Question::Multiplication and question.contains?(12)
  end

  # @override
  def possible_questions
    Question::Multiplication.any_matching(12)
  end

end
