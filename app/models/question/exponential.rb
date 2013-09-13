class Question::Exponential < Question::Binary

  #@override
  def self.new_expression(left, right)
    ExponentialExpression.build left, right
  end
end