# Squares to memorize
class Strategy::Square < Strategy
  UPPER_LIMIT = 36

  def name
    'Square'
  end

  def hint
    'Good square numbers to memorize.'
  end

  def question_qualifies?(question)
    question.is_a? Question::Exponential and question.exponent.to_i == 2 and question.base.to_i < UPPER_LIMIT
  end

  # @override
  def possible_questions
    Question::Exponential.all
  end


end