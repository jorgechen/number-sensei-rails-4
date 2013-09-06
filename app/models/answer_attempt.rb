class AnswerAttempt < ActiveRecord::Base
  extend Enumerize
  enumerize :result, :in => [:right, :wrong, :skipped], :default => :skipped

  belongs_to :challenge_attempt
  belongs_to :question

  validates :challenge_attempt_id,
            :presence => true

  validates :question_id,
            :presence => true,
            :uniqueness => { :scope => :challenge_attempt_id }
end
