class Strategy::CompareFractions < Strategy
  def name
    'Compare Fractions'
  end

  def hint
    'Divide by 2, then append 0 or 5.'
  end

  def question_qualifies?(q)
  end
end
