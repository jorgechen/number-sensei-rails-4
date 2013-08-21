class CreateExpressionValuePairings < ActiveRecord::Migration
  def change
    create_table :expression_value_pairings do |t|
      t.references :expression, index: true
      t.references :value, index: true, polymorphic: true

      t.timestamps
    end
  end
end
