# Convert Arabic numeral to Roman numeral
# Example: 783 = ______ (Roman numeral)
class Question::ArabicToRomanNumeral < Question

  def arabic
    problem.value
  end

  def roman
    RomanNumerals.to_roman(arabic)
  end

  #@abstract
  def problem_plain_text
    "#{arabic}"
  end

  #@abstract
  def problem_html
    "#{arabic}"
  end

  #@abstract
  def solution_plain_text
    "#{roman}"
  end

  #@abstract
  def solution_html
    "#{roman}"
  end

  # @override
  def appendix
    '(Roman numeral)'
  end

  def self.build(arabic)
    x = self.new
    x.problem = IntegerNumber.build(arabic)
    x
  end

end