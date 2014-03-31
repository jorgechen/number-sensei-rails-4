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
    "#{base}<sup>#{exponent}</sup>"
  end

  #@override
  def self.build_problem(left, right)
    ::Exponential.build left, right
  end
end