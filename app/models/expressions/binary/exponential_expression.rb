class ExponentialExpression < BinaryExpression

  def exponent
    right
  end

  def base
    left
  end

  def plain_text
    "#{left.to_s}^#{right.to_s}"
  end

  def html
    "#{left.to_s}<sup>#{right.to_s}</sup>"
  end

  # @override
  def evaluate
    (left.evaluate) ** right.evaluate
  end
end
