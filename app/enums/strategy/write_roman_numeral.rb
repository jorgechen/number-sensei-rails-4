class Strategy::WriteRomanNumeral < Strategy
  def name
    'Write Roman Numerals'
  end

  def hint
    'I, V, X, L, C, D, M'
  end

  def question_qualifies?(question)
    question.is_a? Question::ArabicToRomanNumeral
  end

  # @override
  def possible_questions
    Question::ArabicToRomanNumeral.all
  end

end
