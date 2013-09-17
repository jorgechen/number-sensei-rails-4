# Question is a relationship between the problem and solution expressions.
class Question < ActiveRecord::Base

  has_many :answer_attempts

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

  #validates :expression_id,
  #          :presence => true

  #validates :answer_id,
  #          :presence => true

  #TODO why does unique check fail?
  validates :plain_text,
            :presence => true,
            :uniqueness => true

  validates :html,
            :presence => true,
            :uniqueness => true

  validates :answer_plain_text,
            :presence => true,
            :uniqueness => true

  validates :answer_html,
            :presence => true,
            :uniqueness => true

  # can be overridden
  def to_s
    plain_text + ' = '
  end

  # can be overridden
  def problem_statement
    html + ' = '
  end

  # The appendix is an optional part of the question appended after the answer box
  def appendix
  end

  def answer
    if @answer.blank?
      @answer = expression.evaluate
    end
    @answer
  end

  def plain_text
    if @plain_text.blank?
      @plain_text = expression.plain_text
    end
    @plain_text
  end

  def html
    if @html.blank?
      @html = expression.html
    end
    @html
  end

  def answer_plain_text
    if @answer_plain_text.blank?
      @answer_plain_text = answer.plain_text
    end
    @answer_plain_text
  end

  def answer_html
    if @answer_html.blank?
      @answer_html = answer.html
    end
    @answer_html
  end

  before_validation :confirm_associations, :confirm_answer

  protected
  def confirm_associations
    plain_text
    html
    answer_plain_text
    answer_html
    answer

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
    if answer.blank?
      self.answer = expression.evaluate
    end
  end

end
