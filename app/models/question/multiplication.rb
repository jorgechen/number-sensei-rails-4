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

end