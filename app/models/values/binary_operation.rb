class BinaryOperation < ActiveRecord::Base

  # Validate uniqueness of two integer operands
  # Validates that left <= right
  validates :left,
            presence: true

  validates :right,
            uniqueness: { :scope => [:left, :type] },
            presence: true

  # Return a class object that is suitable to represent the answer
  #@abstract
  def solve
    nil
  end

  #@return new, unsaved instance
  def self.build(left, right)
    where(left: left, right: right, type: self.name).first_or_initialize
  end

end
