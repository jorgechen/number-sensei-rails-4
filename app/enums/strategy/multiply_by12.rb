class Strategy::MultiplyBy12 < Strategy
  def name
    'Multiply by 12'
  end

  def hint
    'Double the number and add it to 10x the number.'
  end

  def question_qualifies?(q)
    if q.is_a? Question::Multiplication and q.expression.has_a? 12
      true
    end
  end
end
