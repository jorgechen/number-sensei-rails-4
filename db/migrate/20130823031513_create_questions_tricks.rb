class CreateQuestionsTricks < ActiveRecord::Migration
  def change
    create_table :questions_tricks do |t|
      t.references :question, index: true
      t.references :trick, index: true
    end
  end
end
