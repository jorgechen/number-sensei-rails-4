class Strategy::MultiplyBy125 < Strategy
  def name
    'Multiply by 125'
  end

  def hint
    'Divide by 8, then append the remainder of 1000 to the right.'
  end

  def question_qualifies?(question)
    question.is_a? Question::Multiplication and question.contains?(125)
  end

  # @override
  def possible_questions
    Question::Multiplication.all
  end

end
