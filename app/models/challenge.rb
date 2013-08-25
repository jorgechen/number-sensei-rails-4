class Challenge < ActiveRecord::Base

  has_many :questions,
           :through => :challenge_question_pairings
            #:order => 'challenge_question_pairings.numbering'

  has_many :challenge_question_pairings,
           -> { order('challenge_question_pairings.numbering') }

  validates :checksum,
            :presence => true,
            :uniqueness => true

  validates :name,
            :presence => true,
            :uniqueness => true


  before_validation :determine_checksum, :determine_name
  protected

  def determine_name
    #TODO instead, randomly generate adjective noun pairs, e.g. 'Pretty Pig', 'Soaring Kite'
    self.name = "Challenge #{id}"
  end

  def determine_checksum
    self.checksum = questions.map {|x| x.id.b(62).to_s(Radix::BASE::B62)}.join(' ')
  end

end
