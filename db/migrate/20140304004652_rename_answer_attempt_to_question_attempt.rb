class RenameAnswerAttemptToQuestionAttempt < ActiveRecord::Migration
  def change
    rename_table :answer_attempts, :question_attempts
  end
end
