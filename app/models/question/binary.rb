# Problem: a binary operation
# Solution: an integer
class Question::Binary < Question
  self.abstract_class = true

  ################

  #@return [TrueClass] true if any field matches given value
  def contains?(value)
    left == value or right == value
  end

  #@param lower [Integer] lower limit, inclusive
  #@param upper [Integer] upper limit, inclusive
  #@return [TrueClass] true if any field is within the range
  def is_in_range?(lower, upper)
    (lower <= left and left <= upper) or (lower <= right and right <= upper)
  end

  ################

  def left
    problem.left
  end

  def right
    problem.right
  end

  # @abstract
  def token_plain_text
    '?'
  end

  #@abstract
  def token_html
    '?'
  end

  #@override
  def problem_plain_text
    "#{left} #{self.token_plain_text} #{right} = "
  end

  #@override
  def problem_html
    "#{left} #{self.token_html} #{right} = "
  end

  #@override
  def solution_plain_text
    "#{solution.to_s}"
  end

  #@override
  def solution_html
    "#{solution.to_s}"
  end


  ################

  # @abstract
  def self.build_problem(left, right)
    nil
  end

  # @return new question
  def self.build(left_leaf, right_leaf)
    x = self.new

    x.problem = build_problem(left_leaf, right_leaf)
    x.solution = x.problem.solve

    x
  end

end