class Question::Addition < Question::Binary

  #@override
  def token_plain_text
    '+'
  end

  #@override
  def token_html
    '+'
  end

  #@override
  def token_latex
    '+'
  end

  #@override
  def self.build_problem(left, right)
    ::BinaryAddition.build(left, right)
  end

end