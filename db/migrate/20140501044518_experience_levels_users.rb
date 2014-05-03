class ExperienceLevelsUsers < ActiveRecord::Migration
  def change
    create_table :experience_levels_users do |t|
      t.references :user, index: true
      t.references :experience_level, index: true

      t.timestamps
    end
  end
end
