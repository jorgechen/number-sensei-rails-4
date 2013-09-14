class Question::Exponential < Question::Binary

  def base
    expression.left
  end

  def exponent
    expression.right
  end

  #@override
  def self.new_expression(left, right)
    ExponentialExpression.build left, right
  end
end