class MultiplicationExpression < BinaryExpression

  def token_plain_text
    '*'
  end

  def token_html
    '&times;'
  end

  #@override
  def evaluate
    left.evaluate * right.evaluate
  end
end
