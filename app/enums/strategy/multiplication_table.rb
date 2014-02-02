class Strategy::MultiplicationTable < Strategy
  def name
    'Multiplication Table'
  end

  def hint
    'Know it by heart!'
  end

  def question_qualifies?(q)
    if q.is_a? Question::Multiplication
      a = q.left.to_i
      b = q.right.to_i
      if 1 <= a and 1 <= b and a <= 12 and b <= 12
        return true
      end
    end
    false
  end

end
