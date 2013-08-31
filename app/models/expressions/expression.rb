class Expression < ActiveRecord::Base
  DELIMITER_PLAIN_TEXT = ' '
  DELIMITER_HTML = '&nbsp;'

  # This model acts as a hierarchical tree
  acts_as_tree order: 'sort_order',
               with_advisory_lock: false

  has_one :expression_value_pairing,
          :foreign_key => 'expression_id'

  has_many :questions,
           :class_name => 'Question',
           :foreign_key => 'expression_id'

  has_many :answers_to_questions,
           :class_name => 'Question',
           :foreign_key => 'answer_id'

  def has_a? value
    if value.is_a? Integer
      self_and_descendants.detect do |expr|
        expr.is_a? IntegerExpression and expr.number.value == value
      end
    elsif value.is_a? Float
      self_and_descendants.detect do |expr|
        expr.is_a? DecimalExpression and expr.number.value == value
      end
    end
  end

  # @override
  def to_s
    plain_text
  end

  ###################################
  ## Abstract
  ###################################
  # @abstract
  # @return [String]
  def plain_text
    '?'
  end

  # @abstract
  # @return [String]
  def html
    '?'
  end

  # @abstract
  # @return [ValueExpression]
  def evaluate
  end


  #############
  class << self
    def new_from_value unknown
      x = nil
      if unknown.is_a? Integer
        x = IntegerExpression.build unknown
      elsif unknown.is_a? Float
        x = DecimalExpression.build unknown
      elsif unknown.is_a? Rational
        n = Fraction.new numerator: unknown.numerator, denominator: unknown.denominator
        #todo
      end
      x
    end
  end


  before_save :save_token
  protected
  def save_token
    self.token = plain_text
  end

end
