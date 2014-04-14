# Question is, at its most basic, a relationship between the problem and answer.
class Question < ActiveRecord::Base

  attr_accessor :skip_trick_assignment

  def skip_trick_assignment
    @skip_trick_assignment || false # default is false
  end

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
  validates_uniqueness_of :problem_id, :scope => [:problem_type, :solution_id, :solution_type]

  # can be overridden
  def to_s
    "#{problem_plain_text}=#{solution_plain_text}"
  end

  #@abstract
  def problem_plain_text
    "#{problem}"
  end

  #@abstract
  def problem_html
    "#{problem}"
  end

  #@abstract
  def solution_plain_text
    "#{solution}"
  end

  #@abstract
  def solution_html
    "#{solution}"
  end

  # The appendix is an optional part of the question appended after the answer box
  #@abstract
  def appendix
    ''
  end

  #@abstract
  def is_any_in_range?(lower, upper)
    false
  end

  #@param solution [String] The user's solution to this question
  #@return True if solution is correct
  def attempt_to_solve(solution)
    #TODO improve checking...
    solution_plain_text == solution
  end


  #@return [Relation] JOIN on question and problems
  def self.join_problem
    joins('INNER JOIN binary_operations ON questions.problem_id = binary_operations.id')
  end


  # CALLBACKS
  after_save :associate_related_tricks

  protected

  # Add relationships to any existing tricks that apply
  def associate_related_tricks
    unless self.skip_trick_assignment
      Armory::assign_tricks(self)
    end
  end
end
