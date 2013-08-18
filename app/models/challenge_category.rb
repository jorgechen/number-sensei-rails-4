class ChallengeCategory < ActiveRecord::Base
  has_many :official_challenges

  validates :name,
            :presence => true,
            :uniqueness => true

  def to_s
    name
  end
end
