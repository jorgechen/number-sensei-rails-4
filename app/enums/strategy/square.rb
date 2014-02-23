class Strategy::Square < Strategy
  def name
    'Square'
  end

  def hint
    'Multiply a number by itself.'
  end

  def question_qualifies?(question)
    question.is_a? Question::Exponential and question.expression.exponent == 2
  end

  # @override
  def possible_questions
    Question::Exponential.all
  end


end