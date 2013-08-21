class DecimalNumber < Value

  # Attribute value
  validates :value,
            :presence => true,
            :uniqueness => true
end
