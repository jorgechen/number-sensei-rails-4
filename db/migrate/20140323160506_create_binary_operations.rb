class CreateBinaryOperations < ActiveRecord::Migration
  def change
    create_table :binary_operations do |t|
      t.integer :left
      t.integer :right
      t.string :type

      t.timestamps
    end
  end
end
