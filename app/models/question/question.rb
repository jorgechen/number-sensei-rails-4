# Question is a relationship between the problem and solution expressions.
class Question < ActiveRecord::Base
  # Callbacks:
  before_validation :confirm_answer, :confirm_associations
  after_save :associate_related_tricks

  has_many :answer_attempts

  has_many :challenges,
           :through => :challenge_question_pairings
  has_many :challenge_question_pairings

  has_many :tricks, :through => :questions_tricks
  has_many :questions_tricks

  #TODO optimize through eager loading?
  belongs_to :expression,
             :dependent => :destroy,
             :autosave => true

  belongs_to :answer,
             :dependent => :destroy,
             :class_name => 'Expression',
             :autosave => true

  # The problem statement should be unique
  validates :plain_text,
            :presence => true,
            :uniqueness => true
  validates :html,
            :presence => true,
            :uniqueness => true

  validates :answer_plain_text,
            :presence => true

  validates :answer_html,
            :presence => true

  # can be overridden
  def to_s
    "#{plain_text} = "
  end

  # can be overridden
  def problem_statement
    "#{html} = "
  end

  # The appendix is an optional part of the question appended after the answer box
  def appendix
  end

  def answer_match
    answer_html
  end


  protected
  def confirm_associations

    self.plain_text = expression.plain_text
    self.html = expression.html

    self.answer_plain_text = answer.plain_text
    self.answer_html = answer.html

    # save new associations
    if expression.new_record?
      expression.save!
      self.expression = expression
    end

    if answer.new_record?
      answer.save!
      self.answer = answer
    end
  end

  # @abstract
  def confirm_answer
    if answer.blank? and expression
      self.answer = expression.evaluate
    end
  end

  # Add relationships to any existing tricks that apply
  def associate_related_tricks
    Armory::assign_tricks(self)
  end
end
