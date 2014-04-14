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

  def self.power_of(power)
    right_matching(power)
  end

  def self.squares
    power_of(2)
  end

  def self.cubes
    power_of(3)
  end

  def self.base_in_range(lower, upper)
    left_in_range(lower, upper)
  end

end