class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :problem, index: true, polymorphic: true
      t.references :solution, index: true, polymorphic: true

      t.timestamps
    end
  end
end
