# Asks you to convert a Roman numeral to Arabic
# Example   XIV = ____
class Question::Factorial < Question

  #@abstract
  def problem_plain_text
    "#{problem}!"
  end

  #@abstract
  def problem_html
    "#{problem}!"
  end

  #@abstract
  def solution_plain_text
    "#{solution}"
  end

  #@abstract
  def solution_html
    "#{solution}"
  end

  #@abstract
  def is_any_in_range?(lower, upper)
    lower <= problem.to_i and problem.to_i <= upper
  end

  def self.build(factorial)
    if factorial > 0
      x = self.new
      x.problem = ::IntegerNumber.build(factorial)

      answer = 1
      (1..factorial).each { |i|
        answer *= i
      }

      x.solution = ::IntegerNumber.build(answer)
      x
    end
  end

end