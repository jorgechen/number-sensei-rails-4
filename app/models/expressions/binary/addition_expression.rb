class AdditionExpression < BinaryExpression

  def token_plain_text
    '+'
  end

  def token_html
    '+'
  end

  #@override
  def evaluate
    left.evaluate + right.evaluate
  end
end
