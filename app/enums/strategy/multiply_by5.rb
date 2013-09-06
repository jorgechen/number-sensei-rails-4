class Strategy::MultiplyBy5 < Strategy
  def name
    'Multiply by 5'
  end

  def hint
    'Divide by 2, then append 0 or 5.'
  end

  def question_qualifies?(q)
    if q.is_a? Question::Multiplication and q.expression.has_a? 5
      true
    end
  end
end
