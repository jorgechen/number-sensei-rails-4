class CreateExpressions < ActiveRecord::Migration
  def change
    create_table :expressions do |t|
      t.string :token
      t.string :type
      t.integer :parent_id
      t.integer :sort_order

      t.timestamps
    end
  end
end
