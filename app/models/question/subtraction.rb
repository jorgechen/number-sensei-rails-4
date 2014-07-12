class Question::Subtraction < Question::Binary

  #@override
  def token_plain_text
    '-'
  end

  #@override
  def token_html
    '&minus;'
  end

  #@override
  def token_latex
    '-'
  end

  #@override
  def self.build_problem(left, right)
    ::BinarySubtraction.build(left, right)
  end

end