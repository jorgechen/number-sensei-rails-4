class CreateAnswerAttempts < ActiveRecord::Migration
  def change
    create_table :answer_attempts do |t|
      t.references :challenge_attempt, index: true
      t.references :question, index: true
      t.string :result

      t.timestamps
    end
  end
end
