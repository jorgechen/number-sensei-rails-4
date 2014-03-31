class Strategy::MultiplyBy5 < Strategy
  def name
    'Multiply by 5'
  end

  def hint
    'Divide by 2, be careful with the remainder.'
  end

  def question_qualifies?(question)
    question.is_a? Question::Multiplication and question.contains?(5)
  end

  # @override
  def possible_questions
    Question::Multiplication.all
  end

end
