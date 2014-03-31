class Strategy::RadixConversion < Strategy
  def name
    'Converting to a Base'
  end

  def hint
    ''
  end

  # @override
  def question_qualifies?(question)
    question.is_a? Question::RadixConversion
  end

  # @override
  def possible_questions
    Question::RadixConversion.all
  end

end
