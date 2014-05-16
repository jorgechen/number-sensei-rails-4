class ExperienceLevel < ActiveRecord::Base

  has_many :users, :through => :experience_level_user
  has_many :experience_level_user_pairings, :dependent => :destroy

  validates :level,
            presence: true,
            uniqueness: true

  validates :experience,
            presence: true,
            uniqueness: true

  validates :level_up_experience,
            uniqueness: true

  def to_s
    "Level #{level}"
  end
end
