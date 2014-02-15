class DivisionExpression < BinaryExpression

  def token_plain_text
    '/'
  end

  def token_html
    '&divide;'
  end

  #@override
  def evaluate
    left.evaluate / right.evaluate
  end
end