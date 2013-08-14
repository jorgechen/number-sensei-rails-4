class CreateChallengeCategories < ActiveRecord::Migration
  def change
    create_table :challenge_categories do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :challenge_categories, :name, unique: true
  end
end
