class ChallengeAttempt < ActiveRecord::Base
  has_many :answer_attempts

  belongs_to :challenge
  belongs_to :user
end
