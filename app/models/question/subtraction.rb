class Question::Subtraction < Question::Binary

  #@override
  def self.new_expression(left, right)
    SubtractionExpression.build left, right
  end

end