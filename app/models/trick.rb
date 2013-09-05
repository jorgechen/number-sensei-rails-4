class Trick < ActiveRecord::Base
  classy_enum_attr :strategy, default: ->(enum){ enum.min }
  #TODO validate uniqueness of strategy, without using the default, which causes error

  has_many :questions, :through => :questions_tricks
  has_many :questions_tricks

  delegate :question_qualifies?, :to => :strategy

  def name
    if @name.blank?
      @name = strategy.name
    end
    @name
  end

  def hint
    if @hint.blank?
      @hint = strategy.hint
    end
    @hint
  end

  def to_s
    strategy.to_s
  end
end
