class Strategy::Cube < Strategy
  def name
    'Cube'
  end

  def hint
    'Multiply 3 of the same numbers.'
  end

  def question_qualifies?(question)
    question.is_a? Question::Exponential and question.expression.exponent == 3
  end

  # @override
  def possible_questions
    Question::Exponential.all
  end

end