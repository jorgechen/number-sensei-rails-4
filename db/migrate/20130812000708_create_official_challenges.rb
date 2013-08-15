class CreateOfficialChallenges < ActiveRecord::Migration
  def change
    create_table :official_challenges do |t|
      t.string :upload
      t.string :name
      t.date :release_date
      t.integer :grade_level
      t.integer :difficulty
      t.string :event
      t.references :category
      t.string :location

      t.timestamps
    end
  end
end
