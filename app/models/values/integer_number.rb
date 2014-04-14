class IntegerNumber < Value

  # This class is usually used as the solution to certain questions
  has_many :questions,
           :as => :solution

  validates :value,
            :presence => true,
            :uniqueness => true

  def to_s
    "#{value}"
  end

  def to_i
    value
  end

  #@return New or existing record of given value
  def self.build(integer_value)
    where(value: integer_value).first_or_create
  end
end
