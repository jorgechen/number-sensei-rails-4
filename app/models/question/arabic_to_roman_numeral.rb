# Convert Arabic numeral to Roman numeral
# Example: 783 = ______ (Roman numeral)
class Question::ArabicToRomanNumeral < Question

  def roman
    RomanNumerals.to_roman(expression.to_i)
  end

  def arabic
    expression.to_i
  end

  def appendix
    '(Roman numeral)'
  end

  def plain_text
    arabic.to_s
  end

  def html
    arabic.to_s
  end

  def answer_plain_text
    roman.to_s
  end

  def answer_html
    roman.to_s
  end



  def self.build(arabic)
    x = self.new
    x.expression = IntegerExpression.build(arabic)
    x
  end

end