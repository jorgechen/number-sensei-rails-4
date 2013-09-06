class Strategy::MultiplyBy25 < Strategy
  def name
    'Multiply by 25'
  end

  def hint
    'Divide by 4, then append 0, 25, 50, or 75.'
  end

  def question_qualifies?(q)
    if q.is_a? Question::Multiplication and q.expression.has_a? 25
      true
    end
  end
end
