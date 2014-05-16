class ExperienceLevelUserPairing < ActiveRecord::Base

  belongs_to :experience_level
  belongs_to :user

end