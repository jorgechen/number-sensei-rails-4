class ExperienceLevel < ActiveRecord::Base
  validates :level,
            presence: true,
            uniqueness: true

  validates :experience,
            presence: true,
            uniqueness: true

  validates :delta,
            uniqueness: true

  def to_s
    "LVL#{level}"
  end
end
