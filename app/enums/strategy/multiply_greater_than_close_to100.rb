class Strategy::MultiplyGreaterThanCloseTo100 < Strategy
  def name
    'Multiply Numbers a Little Over 100'
  end

  def hint
    ''
  end

  #@param q [Question::Multiplication]
  def question_qualifies?(q)
    if q.is_a? Question::Multiplication
      a = q.left.to_i
      b = q.right.to_i
      if 101 < a and 101 < b and a < 110 and b < 110
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
