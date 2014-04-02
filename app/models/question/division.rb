class Question::Division < Question::Binary

  def dividend
    left
  end

  def divisor
    right
  end

  def quotient
    solution
  end

  #@override
  def token_plain_text
    '/'
  end

  #@override
  def token_html
    '&divide;'
  end

  #@override
  def self.build_problem(left, right)
    ::Fraction.build(left, right)
  end

end