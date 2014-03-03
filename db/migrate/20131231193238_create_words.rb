class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :part_of_speech # e.g. noun
      t.text :category # e.g. color
      t.text :spelling # e.g. "red"
      t.text :note #e.g. "#ff0000"

      t.timestamps
    end
  end
end
