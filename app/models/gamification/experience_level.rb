class ExperienceLevel < ActiveRecord::Base

  has_many :users, :through => :experience_level_user
  has_many :experience_level_user

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
