class RadixNumber < BinaryOperation
  def base_10_value
    left
  end

  def base
    right
  end

  def radix
    right
  end

end