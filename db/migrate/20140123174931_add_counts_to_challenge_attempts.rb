class AddCountsToChallengeAttempts < ActiveRecord::Migration
  def change
    change_table :challenge_attempts do |t|
      t.integer :score
      t.integer :time_taken
    end

    change_table :answer_attempts do |t|
      t.references :user, index: true
      t.integer :order # Order in which the question appeared to the user
      t.string :answer # User's attempted answer
    end
  end
end
