# Squares to memorize
class Strategy::Square < Strategy

  def name
    'Square'
  end

  def hint
    'Good square numbers to memorize.'
  end

  def question_qualifies?(question)
    question.is_a? Question::Exponential and question.exponent == 2 and question.base <= 35
  end

  # @override
  def possible_questions
    Question::Exponential.all
  end


end