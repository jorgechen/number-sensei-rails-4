#NOTE: equivalent to a binary integer division
class Fraction < BinaryOperation

  def numerator
    left
  end

  def denominator
    right
  end

  # numerator
  validates :left,
            :presence => true,
            :uniqueness => {:scope => :right}

  # denominator
  validates :right,
            :presence => true,
            :numericality => {:greater_than => 0}


  #@override
  def to_s
    "#{left}/#{right}"
  end

  #@return [Integer] a whole number part of this fraction
  def whole_number
    left / right
  end

  #@return [Integer] reminder, a.k.a. numerator of the mixed number
  def remainder
    left % right
  end

  #@return [Rational] a Ruby object representing the fraction
  def rational
    Rational(left, right)
  end


  #@override
  def solve
    self
  end
end
