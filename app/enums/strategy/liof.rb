class Strategy::Liof < Strategy
  def name
    'LIOF'
  end

  def hint
    'Last Inside Outside First'
  end

  LOWER_LIMIT = 12
  UPPER_LIMIT = 100

  # @override
  def question_qualifies?(question)
    if question.is_a? Question::Multiplication
      a = question.left.to_i
      b = question.right.to_i
      if  LOWER_LIMIT < a and a < UPPER_LIMIT and
          LOWER_LIMIT < b and b < UPPER_LIMIT
        return true
      end
    end
    false
  end

  # @override
  def possible_questions
    Question::Multiplication.all
  end

end