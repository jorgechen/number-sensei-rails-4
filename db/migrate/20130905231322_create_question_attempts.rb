class CreateQuestionAttempts < ActiveRecord::Migration
  def change
    create_table :question_attempts do |t|
      t.references :challenge_attempt, index: true
      t.references :question, index: true
      t.references :user, index: true
      t.string :result
      t.string :answer # User's attempted answer
      t.integer :order # Order in which the question appeared to the user

      t.timestamps
    end
  end
end
