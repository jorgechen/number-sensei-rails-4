class CreateIntegerNumbers < ActiveRecord::Migration
  def change
    create_table :integer_numbers do |t|
      t.integer :value

      t.timestamps
    end
    add_index :integer_numbers, :value, unique: true
  end
end
