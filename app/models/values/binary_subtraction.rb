class BinarySubtraction < BinaryOperation

  #@override
  def solve
    IntegerNumber.build(left - right)
  end

end