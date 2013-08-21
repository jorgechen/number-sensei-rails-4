class Fraction < Value
  # Attribute numerator
  validates :numerator,
            :presence => true,
            :uniqueness => {:scope => :denominator}

  # Attribute denominator
  validates :denominator,
            :presence => true,
            :numericality => {:greater_than =>  0}

  #@return a whole number part of this fraction
  def whole_number
    numerator / denominator
  end

  #@return the numerator in this fraction minus the whole number
  def proper_fraction_numerator
    numerator % denominator
  end

end
