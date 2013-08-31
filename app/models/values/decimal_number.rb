class DecimalNumber < Value

  # Attribute value
  validates :value,
            :presence => true,
            :uniqueness => true

  def self.build(float_value)
    where(value: float_value).first_or_create
  end
end
