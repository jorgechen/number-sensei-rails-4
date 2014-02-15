class Question::Division < Question::Binary

  #@override
  def self.new_expression(left, right)
    DivisionExpression.build left, right
  end

  def dividend
    expression.left.to_i
  end

  def divisor
    expression.right.to_i
  end

  def quotient
    answer.to_f #TODO default set to fractions?
  end

end