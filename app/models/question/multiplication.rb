class Question::Multiplication < Question::Binary

  #@override
  def self.new_expression(left, right)
    MultiplicationExpression.build left, right
  end

end