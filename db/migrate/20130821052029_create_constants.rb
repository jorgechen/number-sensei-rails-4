class CreateConstants < ActiveRecord::Migration
  def change
    create_table :constants do |t|
      t.float :value
      t.string :symbol
      t.string :name

      t.timestamps
    end
    add_index :constants, :value, unique: true
    add_index :constants, :symbol, unique: true
    add_index :constants, :name, unique: true
  end
end
