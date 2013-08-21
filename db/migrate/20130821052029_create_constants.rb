class CreateConstants < ActiveRecord::Migration
  def change
    create_table :constants do |t|
      t.float :value
      t.string :plain_text
      t.string :html
      t.string :name

      t.timestamps
    end
    add_index :constants, :value, unique: true
    add_index :constants, :plain_text, unique: true
    add_index :constants, :html, unique: true
    add_index :constants, :name, unique: true
  end
end
