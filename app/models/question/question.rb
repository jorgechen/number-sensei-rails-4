class Question < ActiveRecord::Base

  has_many :answer_attempts

  has_many :tricks, :through => :questions_tricks
  has_many :questions_tricks

  #TODO optimize through eager loading?
  belongs_to :expression,
             :autosave => true

  belongs_to :answer,
             :class_name => 'Expression',
             :foreign_key => 'answer_id',
             :autosave => true

  validates :expression_id,
            :presence => true

  validates :answer_id,
            :presence => true

  validates :plain_text,
            :uniqueness => true

  validates :html,
            :uniqueness => true

  validates :answer_plain_text,
            :uniqueness => true

  validates :answer_html,
            :uniqueness => true

  # can be overridden
  def to_s
    plain_text + ' = '
  end

  # can be overridden
  def to_html
    html + ' = '
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
