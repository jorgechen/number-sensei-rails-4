class Question::Division < Question::Binary

  def dividend
    left
  end

  def divisor
    right
  end

  def quotient
    solution
  end

  #@override
  def token_plain_text
    '/'
  end

  #@override
  def token_html
    '&divide;'
  end

  #@override
  def token_latex
    '\div'
  end

  #@override
  def self.build_problem(left, right)
    ::Fraction.build(left, right)
  end

  # Questions where all values are within given range.
  #@param lower [Integer]
  #@param upper [Integer]
  #@return [Relation]
  def self.divisor_in_range(lower, upper)
    joins('INNER JOIN binary_operations ON questions.problem_id = binary_operations.id').merge(BinaryMultiplication.right_in_range(lower, upper))
  end

end