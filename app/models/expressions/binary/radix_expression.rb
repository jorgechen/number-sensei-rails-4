# Represents an integer with a base, i.e. 101 in base of 2
class RadixExpression < BinaryExpression

  def decimal
    left.to_i
  end

  # The radix itself is expressed as a decimal
  def radix
    right.to_i
  end

  def value_string
    decimal.to_s(radix)
  end

  # @override
  def plain_text
    "#{value_string}b#{radix}"
  end

  # @override
  def html
    "#{value_string}<sub>#{radix}</sub>"
  end

  # @override
  def evaluate
    decimal
  end

end
