class ChallengeQuestionPairing < ActiveRecord::Base

  validates :numbering,
            :uniqueness => {:scope => :challenge_id}

  belongs_to :challenge
  belongs_to :question

end
