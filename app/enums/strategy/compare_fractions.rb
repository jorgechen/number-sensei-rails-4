class Strategy::CompareFractions < Strategy
  def name
    'Compare Fractions'
  end

  def hint
    'The bigger fraction after crossing denominators.'
  end

  def question_qualifies?(q)
  end
end
