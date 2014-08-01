# Asks you to convert a Roman numeral to Arabic
# Example   XIV = ____
class Question::RomanToArabicNumeral < Question

  def arabic
    problem.value
  end

  def roman
    RomanNumerals.to_roman(arabic)
  end

  #@abstract
  def problem_plain_text
    "#{roman}"
  end

  #@abstract
  def problem_html
    "#{roman}"
  end

  #@abstract
  def problem_latex
    "#{roman}"
  end

  #@abstract
  def solution_plain_text
    "#{arabic}"
  end

  #@abstract
  def solution_html
    "#{arabic}"
  end

  #@abstract
  def solution_latex
    "#{arabic}"
  end

  # @override
  def appendix
    '(Arabic numeral)'
  end

  # @override
  def appendix_html
    '(Arabic numeral)'
  end

  # @override
  def appendix_latex
    '(Arabic\ numeral)'
  end



  def self.build(arabic)
    x = self.new
    x.problem = ::IntegerNumber.build(arabic)
    x.solution = ::RomanNumeral.build(arabic)
    x
  end

end