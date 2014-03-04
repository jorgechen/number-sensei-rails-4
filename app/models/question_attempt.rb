class QuestionAttempt < ActiveRecord::Base
  extend Enumerize
  enumerize :result, :in => [:right, :wrong, :skipped], :default => :skipped
  # NOTE: if a question is not reached, then an attempt will not be created

  belongs_to :challenge_attempt
  belongs_to :question
  belongs_to :user

  validates :challenge_attempt_id,
            presence: true

  validates :question_id,
            uniqueness: { :scope => :challenge_attempt_id },
            presence: true

  validates :user_id,
            presence: true

  validates :answer,
            presence: true

  validates :order,
            presence: true

  validates :result,
            presence: true
end
