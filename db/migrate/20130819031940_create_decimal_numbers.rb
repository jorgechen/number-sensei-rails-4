class CreateDecimalNumbers < ActiveRecord::Migration
  def change
    create_table :decimal_numbers do |t|
      t.float :value

      t.timestamps
    end
    add_index :decimal_numbers, :value, unique: true
  end
end
