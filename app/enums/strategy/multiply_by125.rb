class Strategy::MultiplyBy125 < Strategy
  def name
    'Multiply by 125'
  end

  def hint
    'Divide by 8, then append the remainder of 1000 to the right.'
  end

  def question_qualifies?(q)
    if q.is_a? Question::Multiplication and q.expression.has_a? 125
      true
    end
  end
end
