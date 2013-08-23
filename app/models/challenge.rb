class Challenge < ActiveRecord::Base

  has_many :questions,
           :through => :challenge_question_pairings
            #:order => 'challenge_question_pairings.numbering'

  has_many :challenge_question_pairings,
           :order => 'challenge_question_pairings.numbering'

  validates :checksum,
            :presence => true,
            :uniqueness => true

  validates :name,
            :presence => true,
            :uniqueness => true


  before_validation :settle_checksum, :settle_name
  protected

  def settle_name
    #TODO instead, randomly generate adjective noun pairs, e.g. 'Pretty Pig', 'Soaring Kite'
    self.name = "Challenge #{id}"
  end

  def settle_checksum
    self.checksum = id.to_s
    #TODO instead of this, generate checksum using challenges
  end

end
