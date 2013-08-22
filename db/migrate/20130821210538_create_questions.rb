class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :expression, index: true
      t.references :answer, index: true
      t.string :html
      t.string :plain_text
      t.string :answer_html
      t.string :answer_plain_text

      t.timestamps
    end
  end
end
