class CreateFractions < ActiveRecord::Migration
  def change
    create_table :fractions do |t|
      t.integer :numerator
      t.integer :denominator

      t.timestamps
    end
    add_index :fractions, [:numerator, :denominator], :unique => true
  end
end
