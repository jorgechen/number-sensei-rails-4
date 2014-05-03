class ChallengeAttempt < ActiveRecord::Base
  has_many :question_attempts,
           -> { order('question_attempts.order') }

  belongs_to :challenge
  belongs_to :user

  validates :challenge_id,
            presence: true

  validates :user_id,
            presence: true

  validates :correct,
            presence: true

  validates :incorrect,
            presence: true

  validates :skipped,
            presence: true

  validates :total,
            presence: true
  #
  #validates :score,
  #          presence: true
  #
  #validates :time_taken,
  #          presence: true


  #@override
  def to_s
    "challenge_attempt_#{id}"
  end

  before_validation :count_it_up

  private

  # @helper
  def self.calculate_score(correct, missed, skipped)
    5 * correct - 4 * (missed + skipped)
  end

  # @callback
  def count_it_up
    self.correct = question_attempts.where(:result => :correct).count
    self.incorrect = question_attempts.where(:result => :missed).count
    self.skipped = question_attempts.where(:result => :skipped).count
    self.total = question_attempts.count
    self.score = ChallengeAttempt.calculate_score(correct, incorrect, skipped)
  end

end
