class ChallengeAttempt < ActiveRecord::Base
  has_many :question_attempts,
           -> { order('question_attempts.order') }

  belongs_to :challenge
  belongs_to :user

  validates :challenge_id,
            presence: true

  validates :user_id,
            presence: true
end
