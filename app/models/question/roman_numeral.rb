# Asks you to convert a Roman numeral to Arabic
class Question::RomanNumeral < Question

  def roman
    RomanNumerals.to_roman(expression.to_i)
  end

  def arabic
    expression.to_i
  end

  # @override
  def appendix
    '(Arabic numeral)'
  end

  # @override
  def plain_text
    roman
  end

  # @override
  def html
    roman
  end

  def self.build(arabic)
    x = self.new
    x.expression = IntegerExpression.build(arabic)
    x
  end

end