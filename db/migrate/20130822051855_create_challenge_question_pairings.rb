class CreateChallengeQuestionPairings < ActiveRecord::Migration
  def change
    create_table :challenge_question_pairings do |t|
      t.references :challenge
      t.references :question, index: true
      t.integer :numbering

      t.timestamps
    end
    add_index :challenge_question_pairings, [:challenge_id, :numbering], :unique => true, :name => 'challenge_question_pair_idx'
  end
end
