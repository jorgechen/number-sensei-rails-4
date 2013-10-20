class BinaryExpression < Expression
  self.abstract_class = true

  attr_accessor :left, :right

  def left
    @left = children.first unless @left
    @left
  end

  def right
    @right = children.last unless @right
    @right
  end


  def self.build left, right
    x = self.new
    x.left = Expression.new_from_value(left)
    x.right = Expression.new_from_value(right)
    x
  end

  # @abstract
  def token_plain_text
  end

  # @abstract
  def token_html
  end

  def plain_text
    "#{left.to_s}#{DELIMITER_PLAIN_TEXT}#{self.token_plain_text}#{DELIMITER_PLAIN_TEXT}#{right.to_s}"
  end

  def html
    "#{left.to_s}#{DELIMITER_PLAIN_TEXT}#{self.token_html}#{DELIMITER_PLAIN_TEXT}#{right.to_s}"
  end

  # @override
  def evaluate
  end


  ################################################################################################
  ## Myriad of helper functions
  ################################################################################################

  # @param a [IntegerExpression]
  # @param b [IntegerExpression]
  # @return [IntegerExpression]
  def self.add_integers(a, b)
    IntegerExpression.build(a.to_i + b.to_i)
  end

  # @param a [IntegerExpression]
  # @param b [IntegerExpression]
  # @return [IntegerExpression]
  def self.subtract_integers(a, b)
    IntegerExpression.build(a.to_i - b.to_i)
  end

  # @param a [IntegerExpression]
  # @param b [IntegerExpression]
  # @return [IntegerExpression]
  def self.multiply_integers(a, b)
    IntegerExpression.build(a.to_i * b.to_i)
  end

  # @param a [IntegerExpression]
  # @param divisor [IntegerExpression]
  # @return [IntegerExpression, FractionExpression] tricky tricky!
  def self.divide_integers(a, b)
    numerator = a.to_i
    denominator = b.to_i
    if denominator == 0
      IntegerExpression.build(999999999)
      #TODO not a number, does not exist
    elsif numerator % denominator == 0
      quotient = numerator / denominator
      IntegerExpression.build(quotient)
    else
      #TODO return decimal or fraction here?
      #FractionExpression.build(numerator, denominator)
      quotient = a.to_f / b.to_f
      DecimalExpression.build(quotient)
    end
  end

  ####################

  # +
  def self.add_integer_and_fraction(integer_expr, fraction_expr)
    top = integer_expr.to_i + fraction_expr.denominator
    bottom = fraction_expr.denominator
    FractionExpression.build(top, bottom)
  end

  # -
  def self.subtract_integer_by_fraction(int, fra)
    FractionExpression.build(int.to_i - fra.denominator, fra.denominator)
  end

  def self.subtract_fraction_by_integer(fra, int)
    FractionExpression.build(fra.numerator - int * fra.denominator, fra.denominator)
  end

  # *
  def self.multiply_integer_and_fraction(int, fra)
    FractionExpression.build(int.to_i * fra.numerator, fra.denominator)
  end

  # /
  def self.divide_integer_by_fraction(int, fra)
    FractionExpression.build(int.to_i * fra.denominator, fra.numerator)
  end

  def self.divide_fraction_by_integer(fra, int)
    FractionExpression.build(int.to_i * fra.numerator, fra.denominator) #same as multiply_integer_and_fraction
  end

  ####################

  def self.add_decimals(a, b)
    DecimalExpression.build(a.to_f + b.to_f)
  end

  def self.subtract_decimals(a, b)
    DecimalExpression.build(a.to_f - b.to_f)
  end

  def self.multiply_decimals(a, b)
    DecimalExpression.build(a.to_f * b.to_f)
  end

  def self.divide_decimals(a, b)
    if b.to_f == 0
      #TODO not a number, does not exist
      DecimalExpression.build(999999.9)
    else
      DecimalExpression.build(a.to_f / b.to_f)
    end
  end

  ####################

  # +
  def self.add_fractions(a, b)
    top = a.numerator * b.denominator + a.denominator * b.numerator
    bottom = a.denominator * b.denominator
    FractionExpression.build(top, bottom)
  end

  # -
  def self.subtract_fractions(a, b)
    top = a.numerator * b.denominator - a.denominator * b.numerator
    bottom = a.denominator * b.denominator
    FractionExpression.build(top, bottom)
  end


  # *
  def self.multiply_fractions(a, b)
    top = a.numerator * b.numerator
    bottom = a.denominator * b.denominator
    FractionExpression.build(top, bottom)
  end


  # /
  def self.divide_fractions(a, b)
    top = a.numerator * b.denominator
    bottom = a.denominator * b.numerator
    FractionExpression.build(top, bottom)
  end

  ####################

  def self.integer_to_power_of_integer(base, exponent)
    IntegerExpression.build((base.to_i) ** exponent.to_i)
  end

  def self.value_to_power_of_decimal(base, exponent)
    DecimalExpression.build((base.to_f) ** exponent.to_f)
  end

  def self.fraction_to_power_of_integer(base, exponent)
    FractionExpression.build(
        (base.numerator) ** exponent.to_i,
        (base.denominator) ** exponent.to_i)
  end

  ################################################################################################
  ## Callbacks
  ################################################################################################

  validate :validate_children

  after_validation :save_kids

  protected

  def validate_children
    errors.add(:children, 'left & right should be expressions') unless left.is_a? Expression and right.is_a? Expression
  end

  def save_kids
    add_child left
    add_child right
  end

  # @override
  def save_token
    self.token = token_plain_text
  end

end
