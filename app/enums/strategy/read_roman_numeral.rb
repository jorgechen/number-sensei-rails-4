class Strategy::ReadRomanNumeral < Strategy
  def name
    'Read Roman Numerals'
  end

  def hint
    'I, V, X, L, C, D, M'
  end

  def question_qualifies?(question)
    question.is_a? Question::RomanToArabicNumeral
  end

  # @override
  def possible_questions
    Question::RomanToArabicNumeral.all
  end

end
