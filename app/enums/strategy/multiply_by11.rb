class Strategy::MultiplyBy11 < Strategy
  def name
    'Multiply by 11'
  end

  def hint
    'Add adjacent digits from right to left.'
  end

  def question_qualifies?(question)
    question.is_a? Question::Multiplication and question.contains?(11)
  end

  # @override
  def possible_questions
    Question::Multiplication.all
  end

end
