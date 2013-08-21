class Expression < ActiveRecord::Base
  # This model acts as a hierarchical tree
  acts_as_tree order: 'sort_order',
               with_advisory_lock: false

  has_one :expression_value_pairing,
          :foreign_key => 'expression_id'

  def to_s
    token
  end
end
