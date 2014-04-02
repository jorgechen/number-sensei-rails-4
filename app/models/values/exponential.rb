class Exponential < BinaryOperation

  def base
    left
  end

  def exponent
    right
  end

  #@override
  def solve
    IntegerNumber.build(left ** right)
  end

end