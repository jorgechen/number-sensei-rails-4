class Strategy::SquareNumberEndingIn5 < Strategy
  def name
    'Square Number Ending in 5'
  end

  def hint
    'Multiply first part by its increment, then write 25.'
  end

  def question_qualifies?(question)
    question.is_a? Question::Exponential and question.expression.exponent == 2 and (question.base.to_i % 10 == 5) and question.base.to_i <= 125
  end

end