class Trick < ActiveRecord::Base
  classy_enum_attr :strategy, default: 'none'

  has_and_belongs_to_many :questions

  validates :strategy,
            :uniqueness => true

  delegate :make_expression, :to => :strategy
end
