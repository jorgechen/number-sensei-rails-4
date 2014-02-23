class Strategy::MultiplyLessThanCloseTo100 < Strategy
  def name
    'Multiply Numbers a Little Under 100'
  end

  def hint
    ''
  end

  #@param q [Question::Multiplication]
  def question_qualifies?(q)
    if q.is_a? Question::Multiplication
      a = q.left.to_i
      b = q.right.to_i
      if 90 < a and 90 < b and a < 100 and b < 100
        return true
      end
    end
    false
  end

  # @override
  def possible_questions
    Question::Multiplication.all
  end

end
