class IntegerExpression < ValueExpression
  has_one :number,
          :through => :expression_value_pairing,
          :source => :value,
          :source_type => 'IntegerNumber'

  # Special case
  # @override
  def ==(other)
    if other.is_a? Integer
      to_i == other
    else
      super
    end
  end

  # @return [Integer]
  def value
    number.value
  end

  #@override
  def plain_text
    value.to_s
  end

  #@override
  def html
    value.to_s
  end


  ###################################
  ## implement interface methods
  ###################################
  def to_f
    value.to_f
  end

  def to_i
    value
  end

  def +(other)
    if other.is_a? IntegerExpression
      BinaryExpression.add_integers(self, other)
    elsif other.is_a? FractionExpression
      BinaryExpression.add_integer_and_fraction(self, other)
    elsif other.is_a? ValueExpression
      BinaryExpression.add_decimals(a, b)
    elsif other.is_a? Expression
      self * other.evaluate
    else
      self
    end
  end


  def -(other)
    if other.is_a? IntegerExpression
      BinaryExpression.subtract_integers(self, other)
    elsif other.is_a? FractionExpression
      BinaryExpression.subtract_integer_by_fraction(self, other)
    elsif other.is_a? ValueExpression
      BinaryExpression.subtract_decimals(self, other)
    elsif other.is_a? Expression
      self - other.evaluate

    else
      self
    end
  end


  def *(other)
    if other.is_a? IntegerExpression
      BinaryExpression.multiply_integers(self, other)
    elsif other.is_a? FractionExpression
      BinaryExpression.multiply_integer_and_fraction(other, self)
    elsif other.is_a? ValueExpression
      BinaryExpression.multiply_decimals(self, other)
    elsif other.is_a? Expression
      self * other.evaluate
    else
      self
    end
  end


  def /(other)
    if other.is_a? IntegerExpression
      BinaryExpression.divide_integers(self, other)
    elsif other.is_a? FractionExpression
      BinaryExpression.divide_integer_by_fraction(self, other)
    elsif other.is_a? ValueExpression
      BinaryExpression.add_decimals(self, other)
    elsif other.is_a? Expression
      self / other.evaluate
    else
      self
    end
  end


  def **(other)
    if other.is_a? IntegerExpression
      BinaryExpression.integer_to_power_of_integer(self, other)
    elsif BinaryExpression.is_a? ValueExpression
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
  # @return [IntegerExpression] new instance with given value
  def self.build(integer_value)
    self.new(number: IntegerNumber.build(integer_value))
  end
end
