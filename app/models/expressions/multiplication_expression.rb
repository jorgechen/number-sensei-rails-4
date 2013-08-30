class MultiplicationExpression < BinaryExpression

  def token_plain_text
    '*'
  end

  def token_html
    '&times;'
  end

  #@override
  def evaluate
    super
    self.left.evaluate * self.right.evaluate
  end
end
