class ChallengeQuestionPairing < ActiveRecord::Base

  belongs_to :challenge
  belongs_to :question

end
