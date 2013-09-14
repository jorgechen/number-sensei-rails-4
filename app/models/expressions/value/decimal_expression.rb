class DecimalExpression < ValueExpression

  has_one :number,
          :through => :expression_value_pairing,
          :source => :value,
          :source_type => 'DecimalNumber'

  # Special case
  # @override
  def ==(other)
    if other.is_a? Float
      to_f == other
    else
      super
    end
  end


  # @return [Float]
  def value
    number.value
  end

  # @override
  def plain_text
    value
  end
  
  # @override
  def html
    value
  end


  ###################################
  ## implement interface methods
  ###################################
  def to_f
    value
  end

  def to_i
    value.round
  end


  def +(other)
    if other.is_a? ValueExpression
      BinaryExpression.add_decimals(self, other)
    elsif other.is_a? Expression
      self + other.evaluate
    else
      self
    end
  end


  def -(other)
    if other.is_a? ValueExpression
      BinaryExpression.subtract_decimals(self, other)
    elsif other.is_a? Expression
      self - other.evaluate
    else
      self
    end
  end


  def *(other)
    if other.is_a? ValueExpression
      BinaryExpression.multiply_decimals(self, other)
    elsif other.is_a? Expression
      self * other.evaluate
    else
      self
    end
  end


  def /(other)
    if other.is_a? ValueExpression
      BinaryExpression.divide_decimals(self, other)
    elsif other.is_a? Expression
      self / other.evaluate
    else
      self
    end
  end


  def **(other)
    if other.is_a? ValueExpression
      BinaryExpression.value_to_power_of_decimal(self, other)
    elsif other.is_a? Expression
      self ** other.evaluate
    else
      self
    end
  end


  ###################################
  ## Class methods
  ###################################
  def self.build(float_value)
    self.new(number: (DecimalNumber.build float_value))
  end

end
