class DecimalNumber < ActiveRecord::Base
  # Attribute value
  validates :value,
            :presence => true,
            :uniqueness => true
end