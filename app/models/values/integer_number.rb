class IntegerNumber < Value

  # Attribute value
  validates :value,
            :presence => true,
            :uniqueness => true

  def self.build(integer_value)
    where(value: integer_value).first_or_create
  end
end
