class IntegerExpression < ValueExpression
  has_one :number,
          :through => :expression_value_pairing,
          :source => :value,
          :source_type => 'IntegerNumber'


  def value
    number.value
  end


  #@override
  def plain_text
    value
  end

  #@override
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
    value
  end

  def *(other)
    result = nil
    if other.is_value?
      var = to_f * other.to_f
      result = IntegerExpression.build(var) #TODO investigate why this cannot be self.build
    elsif other.is_expressible?
      result = self * other.evaluate
    end
    result
  end

  def /(other)
    result = nil
    if other.is_value?
      var = to_f / other.to_f
      result = IntegerExpression.build(var)
    elsif other.is_expressible?
      result = self / other.evaluate
    end
    result
  end

  def +(other)
    result = nil
    if other.is_value?
      var = to_f + other.to_f
      result = IntegerExpression.build(var)
    elsif other.is_expressible?
      result = self + other.evaluate
    end
    result
  end

  def -(other)
    result = nil
    if other.is_value?
      var = to_f - other.to_f
      result = IntegerExpression.build(var)
    elsif other.is_expressible?
      result = self - other.evaluate
    end
    result
  end

  def **(other)
    result = nil
    if other.is_value?
      base = Integer(to_f) rescue 0
      exponent = Integer(other.to_f) rescue 0
      result = IntegerExpression.build ((base) ** exponent)
    elsif other.is_expressible?
      result = self ** other.evaluate
    end
    result
  end


  ###################################
  ## Class methods
  ###################################
  class << self
    def build(float_value)
      self.new(number: (DecimalNumber.new value: float_value))
    end
  end
end
