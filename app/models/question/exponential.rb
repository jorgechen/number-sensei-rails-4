class Question::Exponential < Question::Binary

  def base
    left
  end

  def exponent
    right
  end

  #@override
  def token_plain_text
    '^'
  end

  #@override
  def problem_html
    "#{problem.base}<sup>#{problem.exponent}</sup>"
  end

  #@override
  def self.build_problem(left, right)
    ::Exponential.build left, right
  end

  def self.cubes_in_range(lower, upper)
    join_problem.merge(::Exponential.base_in_range(lower, upper)).merge(::Exponential.cubes)
  end

  def self.squares_in_range(lower, upper)
    join_problem.merge(::Exponential.base_in_range(lower, upper)).merge(::Exponential.squares)
  end

end