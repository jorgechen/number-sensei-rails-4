class CreateExperienceLevels < ActiveRecord::Migration
  def change
    create_table :experience_levels do |t|
      t.integer :level
      t.integer :experience
      t.integer :delta

      t.timestamps
    end
  end
end
