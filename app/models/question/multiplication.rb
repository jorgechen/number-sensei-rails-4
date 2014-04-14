class Question::Multiplication < Question::Binary

  #@override
  def token_plain_text
    '*'
  end

  #@override
  def token_html
    '&times;'
  end

  #@override
  def self.build_problem(left, right)
    ::BinaryMultiplication.build(left, right)
  end

  # Questions whwere given value matches any of the values in the problem.
  #@param value [Integer]
  #@return [Relation]
  def self.any_matching(value)
    joins('INNER JOIN binary_operations ON questions.problem_id = binary_operations.id').merge(BinaryMultiplication.any_matching(value))
  end

  # Questions where all values are within given range.
  #@param lower [Integer]
  #@param upper [Integer]
  #@return [Relation]
  def self.all_in_range(lower, upper)
    joins('INNER JOIN binary_operations ON questions.problem_id = binary_operations.id').merge(BinaryMultiplication.all_in_range(lower, upper))
  end

end