class AddExperienceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :experience, :integer, default: 0
    rename_column :experience_levels, :delta, :level_up_experience
  end
end
