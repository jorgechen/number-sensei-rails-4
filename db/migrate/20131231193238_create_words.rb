class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :part_of_speech
      t.text :category
      t.text :spelling
      t.text :note

      t.timestamps
    end
  end
end
