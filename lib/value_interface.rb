# an interface for overloading operators
module ValueInterface

  #@abstract
  def to_f
    0.0
  end

  #@abstract
  def to_i
    0
  end

  #@abstract
  def *(other)
  end

  #@abstract
  def /(other)
  end

  #@abstract
  def +(other)
  end

  #@abstract
  def -(other)
  end

  #@abstract
  def **(other)
  end


  #####################################
  # Do not override
  #####################################
  def is_decimal?
    self.is_a? DecimalExpression
  end

  def is_integer?
    self.is_a? IntegerExpression
  end

  def is_fraction?
    self.is_a? FractionExpression
  end

  def is_value?
    is_decimal? or is_integer? or is_fraction?
  end

  def is_expressible?
    self.is_a? Expression
  end

  #TODO is this needed?
  #def coerce(other)
  #  return self, other
  #end
end