class Strategy::MultiplyBy11 < Strategy
  def name
    'Multiply by 11'
  end

  def hint
    #'Add adjacent digits, one by one, from right to left.'
  end

  def question_qualifies?(q)
    if q.is_a? Question::Multiplication and q.expression.has_a? 11
      true
    end
  end
end
