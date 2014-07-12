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
  #@return [TrueClass] true if ONE of the fields is within the range
  def is_any_in_range?(lower, upper)
    (lower <= left and left <= upper) or (lower <= right and right <= upper)
  end

  #@param lower [Integer] lower limit, inclusive
  #@param upper [Integer] upper limit, inclusive
  #@return [TrueClass] true if BOTH of the fields is within the range
  def is_both_in_range?(lower, upper)
    (lower <= left and left <= upper) and (lower <= right and right <= upper)
  end

  #@return [TrueClass] true if left field is in range
  def is_left_in_range?(lower, upper)
    (lower <= left and left <= upper)
  end

  #@return [TrueClass] true if left field is in range
  def is_right_in_range?(lower, upper)
    (lower <= right and right <= upper)
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

  #@abstract
  def token_latex
    '?'
  end

  #@override
  def problem_plain_text
    "#{left} #{self.token_plain_text} #{right}"
  end

  #@override
  def problem_html
    "#{left} #{self.token_html} #{right}"
  end

  #@override
  def problem_latex
    "#{left} #{self.token_latex} #{right}"
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