class ExperienceLevelUserPairings < ActiveRecord::Migration
  def change
    create_table :experience_level_user_pairings do |t|
      t.references :user, index: true
      t.references :experience_level, index: true

      t.timestamps
    end
  end
end
