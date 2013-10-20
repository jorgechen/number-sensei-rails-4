class Challenge < ActiveRecord::Base
  has_and_belongs_to_many :chunks

  has_many :challenge_attempts

  has_many :questions,
           :through => :challenge_question_pairings
            #:order => 'challenge_question_pairings.numbering'

  has_many :challenge_question_pairings,
           -> { order('challenge_question_pairings.numbering') }

  validates :checksum,
            :presence => true,
            :uniqueness => true

  validates :name,
            #:presence => true,
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


  def self.make(trick)
    # random questions
    list_of_questions = []
    # NOTE: try to avoid random, due to efficiency
    #TODO

    self.make_with_questions(trick, list_of_questions)
  end


  def self.make_with_questions(trick, list_of_questions)
    chunk = Challenge.new
    chunk.questions << list_of_questions
    chunk.save
    chunk
  end

end
