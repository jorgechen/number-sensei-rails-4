class CreateTricks < ActiveRecord::Migration
  def change
    create_table :tricks do |t|
      t.string :strategy
      t.string :name

      t.timestamps
    end
  end
end
