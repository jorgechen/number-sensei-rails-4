class QuestionAttempt < ActiveRecord::Base
  extend Enumerize
  enumerize :result, :in => [:correct, :missed, :skipped, :unfinished], :default => :unfinished
  # NOTE: if a question is not reached, then an attempt will not be created

  belongs_to :challenge_attempt
  belongs_to :question
  belongs_to :user

  # NOTES:
  # Does not necessarily need a ChallengeAttempt.
  # Answer can be blank if user did not attempt it.

  validates :question_id,
            uniqueness: {:scope => :challenge_attempt_id},
            presence: true

  validates :user_id,
            presence: true

  validates :order,
            uniqueness: {:scope => :challenge_attempt_id}

  validates :result,
            presence: true

  #@override
  def to_s
    "[#{order}]#{question.problem_plain_text}=#{answer}(#{result})"
  end

  def to_hash
    {
        result: result,
        answer: answer,
        correct_answer: question.solution_plain_text
    }
  end

end
