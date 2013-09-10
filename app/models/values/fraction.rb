class Fraction < Value
  # Attribute numerator
  validates :numerator,
            :presence => true,
            :uniqueness => {:scope => :denominator}

  # Attribute denominator
  validates :denominator,
            :presence => true,
            :numericality => {:greater_than =>  0}


  # @override
  def to_s
    "#{numerator}/#{denominator}"
  end

  # @return [Integer] a whole number part of this fraction
  def whole_number
    numerator / denominator
  end

  # @return [Integer] the numerator in this fraction minus the whole number
  def proper_fraction_numerator
    numerator % denominator
  end

  # @return [Rational]
  def rational
    Rational(numerator, denominator)
  end

  # @return [Fraction] new and unsaved Fraction
  def self.build(numerator, denominator)
    where(numerator: numerator, denominator: denominator).first_or_create
  end

end
