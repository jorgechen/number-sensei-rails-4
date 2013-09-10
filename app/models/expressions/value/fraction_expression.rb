class FractionExpression < ValueExpression
  has_one :fraction,
          :through => :expression_value_pairing,
          :source => :value,
          :source_type => 'Fraction'

  validates :fraction,
            :presence => true


  def to_s
    plain_text
  end

  #@override
  def plain_text
    "#{fraction.numerator}/#{fraction.denominator}"
  end

  #@override
  def html
    "<sup>#{fraction.numerator}</sup>&frasl;<sub>#{fraction.denominator}</sub>"
  end


  ###################################
  ## Specific to fractions
  ###################################

  # @return [Integer]
  def numerator
    fraction.numerator
  end

  # @return [Integer]
  def denominator
    fraction.denominator
  end


  ###################################
  ## Interface methods
  ###################################

  # @return [Float]
  def to_f
    fraction.rational.to_f
  end

  # @return [Integer]
  def to_i
    fraction.rational.to_i
  end


  # @return [ValueExpression]
  def +(other)
    if other.is_a? IntegerExpression
      BinaryExpression.add_integer_and_fraction(other, self)
    elsif other.is_a? FractionExpression
      BinaryExpression.add_fractions(self, other)
    elsif other.is_a? ValueExpression
      BinaryExpression.add_decimals(self, other)
    elsif other.is_a? Expression
      self + other.evaluate
    else
      self
    end
  end


  # @return [ValueExpression]
  def -(other)
    if other.is_a? IntegerExpression
      BinaryExpression.subtract_fraction_by_integer(self, other)
    elsif other.is_a? FractionExpression
      BinaryExpression.subtract_fractions(self, other)
    elsif other.is_a? ValueExpression
      BinaryExpression.subtract_decimals(self, other)
    elsif other.is_a? Expression
      self - other.evaluate
    else
      self
    end
  end


  # @return [ValueExpression]
  def *(other)
    if other.is_a? IntegerExpression
      BinaryExpression.multiply_integer_and_fraction(other, self)
    elsif other.is_a? FractionExpression
      BinaryExpression.multiply_fractions(self, other)
    elsif other.is_a? ValueExpression
      BinaryExpression.multiply_decimals(self, other)
    elsif other.is_a? Expression
      self * other.evaluate
    else
      self
    end
  end


  # @return [ValueExpression]
  def /(other)
    if other.is_a? IntegerExpression
      BinaryExpression.divide_fraction_by_integer(self, other)
    elsif other.is_a? FractionExpression
      BinaryExpression.divide_fractions(self, other)
    elsif other.is_a? ValueExpression
      BinaryExpression.divide_decimals(self, other)
    elsif other.is_a? Expression
      self / other.evaluate
    else
      self
    end
  end


  # @return [ValueExpression]
  def **(other)
    if other.is_a? IntegerExpression
      BinaryExpression.fraction_to_power_of_integer(self, other)
    elsif other.is_a? ValueExpression
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
  def self.build(numerator, denominator)
    self.new(fraction: Fraction.build(numerator, denominator))
  end
end