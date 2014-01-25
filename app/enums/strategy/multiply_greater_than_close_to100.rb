class Strategy::MultiplyGreaterThanCloseTo100 < Strategy
  def name
    'Multiply Numbers Greater Than and Close to 100'
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
end
