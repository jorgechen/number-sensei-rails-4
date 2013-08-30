class Question::Division < Question::Binary

  #@override
  def self.new_expression(left, right)
    DivisionExpression.build left, right
  end

end