class CreateTricks < ActiveRecord::Migration
  def change
    create_table :tricks do |t|
      t.string :strategy
      t.string :name
      t.text :hint
      t.text :guide

      t.timestamps
    end
  end
end
