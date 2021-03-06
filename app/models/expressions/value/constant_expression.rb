class ConstantExpression < ValueExpression

  has_one :constant,
          :through => :expression_value_pairing,
          :source => :value,
          :source_type => 'Constant'

  # Special case
  # @override
  def ==(other)
    if other.is_a? String
      constant.name == other or constant.symbol == other
    else
      super
    end
  end

  # @return [Float]
  def value
    constant.value
  end

  # @override
  def plain_text
    constant.name
  end

  # @override
  def html
    constant.symbol
  end


  ###################################
  ## implement interface methods
  ###################################

  ### NOTE: these are exactly like DecimalExpression
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
  def self.build(name, symbol, value)
    self.new(number: (Constant.build(name, symbol, value)))
  end

end
