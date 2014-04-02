class CreateChallengeAttempts < ActiveRecord::Migration
  def change
    create_table :challenge_attempts do |t|
      t.references :challenge, index: true
      t.references :user, index: true
      t.integer :correct
      t.integer :incorrect
      t.integer :skipped
      t.integer :total
      t.integer :score
      t.integer :time_taken

      t.timestamps
    end
  end
end
