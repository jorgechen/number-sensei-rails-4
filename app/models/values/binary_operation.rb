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

  ######################################################################
  # Class methods
  ######################################################################

  #@return new, unsaved instance
  def self.build(left, right)
    where(left: left, right: right, type: self.name).first_or_initialize
  end

  #@param value [Integer] a value to match
  #@return [Relation] scope of rows with any that matches value
  def self.any_matching(value)
    where("binary_operations.left = ? OR binary_operations.right = ?", value, value)
  end

  #@param value [Integer]
  #@return [Relation] rows with matching right value
  def self.right_matching(value)
    where("binary_operations.right = ?", value)
  end

  #@param value [Integer]
  #@return [Relation] rows with matching leftvalue
  def self.left_matching(value)
    where("binary_operations.left = ?", value)
  end

  #@param lower [Integer]
  #@param upper [Integer]
  #@return [Relation] Rows where all fields must be in range
  def self.all_in_range(lower, upper)
    left_in_range(lower, upper).merge(right_in_range(lower, upper))
  end

  #@param lower [Integer]
  #@param upper [Integer]
  #@return [Relation] Rows where any field is range
  def self.any_in_range(lower, upper)
    where("(binary_operations.left BETWEEN ? AND ?) OR (binary_operations.right BETWEEN ? AND ?)", lower, upper, lower, upper)
  end

  def self.left_in_range(lower, upper)
    where("(binary_operations.left BETWEEN ? AND ?)", lower, upper)
  end

  def self.right_in_range(lower, upper)
    where("(binary_operations.right BETWEEN ? AND ?)", lower, upper)
  end

end
