class BinaryAddition < BinaryOperation

  #@abstract
  def solve
    IntegerNumber.build(left + right)
  end

end