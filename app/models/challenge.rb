class Challenge < ActiveRecord::Base

  # Challenge is a hierarchical tree
  acts_as_tree with_advisory_lock: false

  #TODO associate trick directly?

  has_many :challenge_attempts

  has_many :questions,
           :through => :challenge_question_pairings
            #:order => 'challenge_question_pairings.numbering'

  has_many :challenge_question_pairings,
           -> { order('challenge_question_pairings.numbering') }

  #TODO checksums for 'super' challenges
  #validates :checksum,
  #          :presence => true,
  #          :uniqueness => true

  #TODO Aesthetically, give each (root) challenge a name
  #validates :name,
  #          :presence => true,
  #          :uniqueness => true

  def all_questions
    Question.joins(:challenges).where('challenges.id' => self_and_descendants.select(:id))
  end

  #@return
  def self.make(trick, requested_question_count = 10)
    # Number of questions
    count = [trick.questions.count, requested_question_count].min
    puts "count=#{count}"

    challenge = nil

    begin
      # generate a random list of questions
      list_of_ids = trick.questions.select('questions.id').to_a
      random_set = list_of_ids.sort{rand() - 0.5}[0...count] # reference http://stackoverflow.com/a/119250/982802
      list_of_questions = Question.where(id: random_set)

      # generate a random name
      #TODO after curating the list of colors


      challenge = Challenge.new(questions: list_of_questions)
    end# while challenge.valid? # checksum invalidates if questions are the same

    challenge
  end

  ########################################
  before_validation :determine_checksum
  protected

  def determine_name
    self.name = "Challenge #{id}"
    #TODO instead, randomly generate adjective noun pairs, e.g. 'Pretty Pig', 'Soaring Kite'
  end

  def determine_checksum
    self.checksum = questions.sort.map {|x| x.id.b(62).to_s(Radix::BASE::B62)}.join('.')
  end

end
