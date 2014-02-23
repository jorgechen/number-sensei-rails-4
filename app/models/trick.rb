class Trick < ActiveRecord::Base
  classy_enum_attr :strategy, default: ->(enum){ enum.min }
  #TODO validate uniqueness of strategy, without using the default, which causes error

  has_many :challenges

  has_many :questions, :through => :questions_tricks
  has_many :questions_tricks,
           :dependent => :destroy

  delegate :question_qualifies?, :to => :strategy
  delegate :possible_questions, :to => :strategy
  delegate :name, :to => :strategy

  def to_s
    strategy.to_s
  end

  after_create :populate_rows

  def populate_rows
    self.name = strategy.name
    self.hint = strategy.hint
  end

end
