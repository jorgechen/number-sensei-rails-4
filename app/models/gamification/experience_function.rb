class ExperienceFunction < ActiveRecord::Base
  has_many :experience_levels

  # The default leveling curve is logarithmic.
  # Override this function in a subclass if desired.
  def calculate_experience_for_level(level)
    x = (coefficient_a * Math.exp(coefficient_b * level)).to_i
    y = 10**(Math.log(x) / Math.log(10) - 2.2).to_i
    (x / y).to_i * y
  end
end
