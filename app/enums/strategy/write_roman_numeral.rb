class Strategy::WriteRomanNumeral < Strategy
  def name
    'Write Roman Numerals'
  end

  def hint
    'I, V, X, L, C, D, M'
  end

  def question_qualifies?(q)
    q.is_a? Question::ArabicToRomanNumeral
  end
end
