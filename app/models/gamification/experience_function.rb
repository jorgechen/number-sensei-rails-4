class ExperienceFunction < ActiveRecord::Base
  has_many :experience_levels

  # The default leveling curve is logarithmic.
  # Override this function in a subclass if desired.
  # @param level
  # @return total experience required for the level
  def calculate_experience_for_level(level)
    x = (coefficient_a * Math.exp(coefficient_b * level)).to_i
    y = 10**(Math.log(x) / Math.log(10) - 2.2).to_i
    (x / y).to_i * y
  end

  # @param current_level
  # @return experience required to level up from current_level
  def calculate_level_up_experience(current_level)
    calculate_experience_for_level(current_level + 1) - calculate_experience_for_level(current_level)
  end

end
