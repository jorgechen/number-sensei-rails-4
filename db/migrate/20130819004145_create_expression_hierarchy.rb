class CreateExpressionHierarchy < ActiveRecord::Migration
  def change
    create_table :expression_hierarchies, :id => false do |t|
      t.integer :ancestor_id, :null => false # ID of the parent/grandparent/great-grandparent/...
      t.integer :descendant_id, :null => false # ID of the target
      t.integer :generations, :null => false # Number of generations between the ancestor and the descendant, e.g. parent/child = 1
    end

    # For "all progeny of…" and leaf selects:
    add_index :expression_hierarchies, [:ancestor_id, :descendant_id, :generations], :unique => true, :name => 'expression_anc_desc_udx'

    # For "all ancestors of…" selects:
    add_index :expression_hierarchies, [:descendant_id], :name => 'expression_desc_idx'
  end
end
