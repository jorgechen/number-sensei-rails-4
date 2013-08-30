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
        n = IntegerNumber.new value: unknown
        x = IntegerExpression.new
        x.value = n
      elsif unknown.is_a? Float
        n = DecimalNumber.new value: unknown
        x = DecimalExpression.new
        x.value = n
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
