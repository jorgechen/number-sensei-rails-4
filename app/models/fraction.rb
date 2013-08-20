class Fraction < ActiveRecord::Base
  # Attribute numerator
  validates :numerator,
            :presence => true,
            :uniqueness => {:scope => :denominator}

  # Attribute denominator
  validates :denominator,
            :presence => true,
            :numericality => {:greater_than =>  0}
end
