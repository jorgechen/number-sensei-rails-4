class Expression < ActiveRecord::Base
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

  def to_s
    token
  end

  before_save :renew_token

  protected
  def renew_token
    self.token = '?' if self.token.blank?
  end
end
