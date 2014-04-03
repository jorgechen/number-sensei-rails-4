# Question is, at its most basic, a relationship between the problem and answer.
class Question < ActiveRecord::Base

  has_many :question_attempts

  has_many :challenges,
           :through => :challenge_question_pairings
  has_many :challenge_question_pairings,
           :dependent => :destroy

  has_many :tricks, :through => :questions_tricks
  has_many :questions_tricks,
           :dependent => :destroy

  belongs_to :problem,
             :polymorphic => true,
             :dependent => :destroy,
             :autosave => true

  belongs_to :solution,
             :polymorphic => true,
             :dependent => :destroy,
             :autosave => true

  # This essentially validates uniqueness of a question
  # NOTE: it is possible to have the same problem/answer for 2 questions
  validates :problem_id,
            :uniqueness => {:scope => :solution_id}

  # can be overridden
  def to_s
    "#{problem_plain_text}=#{solution_plain_text}"
  end

  BLANK_TEXT = '2 + 2'

  #@abstract
  def problem_plain_text
    BLANK_TEXT
  end

  #@abstract
  def problem_html
    BLANK_TEXT
  end

  #@abstract
  def solution_plain_text
    BLANK_TEXT
  end

  #@abstract
  def solution_html
    BLANK_TEXT
  end

  # The appendix is an optional part of the question appended after the answer box
  #@abstract
  def appendix
    ''
  end

  #@param solution [String] The user's solution to this question
  #@return True if solution is correct
  def attempt_to_solve(solution)
    #TODO improve checking...
    solution_plain_text == solution
  end

  # CALLBACKS
  after_save :associate_related_tricks

  protected

  # Add relationships to any existing tricks that apply
  def associate_related_tricks
    Armory::assign_tricks(self)
  end
end
