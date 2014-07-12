# This question asks you to convert a number from base to base
# 104 (base 4) = ____ (base 8)
class Question::RadixConversion < Question

  #@override
  def problem_plain_text
    "#{problem.base_10_value}b#{problem.radix}"
  end

  #@override
  def problem_html
    "#{problem.base_10_value}<sub>#{problem.radix}</sub>"
  end

  #@override
  def problem_latex
    "#{problem.base_10_value}_{#{problem.radix}}"
  end

  #@override
  def solution_plain_text
    "#{solution.base_10_value}b#{solution.radix}"
  end

  #@override
  def solution_html
    "#{solution.base_10_value}<sub>#{solution.radix}</sub>"
  end

  #@override
  def solution_latex
    "#{solution.base_10_value}_{#{solution.radix}}"
  end

  # @override
  def appendix
    "b#{solution.radix}"
  end

  # @override
  def appendix_html
    "<sub>#{solution.radix}</sub>"
  end

  # @override
  def appendix_latex
    "_{#{solution.radix}}"
  end

  #@override
  def problem_statement
    #TODO refine
    "#{problem_html} = <code>_____________</code><sub>#{answer.radix}</sub>"
  end

  def self.build(base_10_value, base_from, base_to)
    x = self.new
    x.problem = RadixNumber.build(base_10_value, base_from)
    x.solution = RadixNumber.build(base_10_value, base_to)
    x
  end

end