class Question::Addition < Question::Binary

  #@override
  def self.new_expression(left, right)
    AdditionExpression.build left, right
  end

end