class Question::RomanNumeral < Question

  def html
  end

  def self.build(arabic)
    x = self.new
    x.expression = IntegerExpression.build(arabic)


    x
  end

end