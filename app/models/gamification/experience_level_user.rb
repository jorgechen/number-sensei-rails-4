class ExperienceLevelUser < ActiveRecord::Base
  self.table_name = 'experience_levels_users'

  belongs_to :experience_level
  belongs_to :user
end