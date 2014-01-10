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


  before_validation :determine_checksum
  protected

  def determine_name
    self.name = "Challenge #{id}"
    #TODO instead, randomly generate adjective noun pairs, e.g. 'Pretty Pig', 'Soaring Kite'
  end

  def determine_checksum
    self.checksum = questions.sort.map {|x| x.id.b(62).to_s(Radix::BASE::B62)}.join('.')
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

end
