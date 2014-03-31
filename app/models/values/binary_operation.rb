class BinaryOperation < ActiveRecord::Base

  # Validate uniqueness of two integer operands
  # Validates that left <= right
  validates :left,
            presence: true

  validates :right,
            uniqueness: { :scope => [:left, :type] },
            presence: true


  #@return new, unsaved instance
  def self.build(left, right)
    self.new(left: left, right: right)
  end

end
