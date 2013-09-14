class Strategy::ReadRomanNumeral < Strategy
  def name
    'Read Roman Numerals'
  end

  def hint
    'I, V, X, L, C, D, M'
  end

  def question_qualifies?(q)
    q.is_a? Question::RomanNumeral
  end
end
