class Challenge < ActiveRecord::Base

  DEFAULT_QUESTION_COUNT = 8

  # Challenge is a hierarchical tree
  acts_as_tree with_advisory_lock: false

  # Each leaf node associates with 1 trick only
  belongs_to :trick

  has_many :challenge_attempts

  has_many :questions,
           :through => :challenge_question_pairings
  #:order => 'challenge_question_pairings.numbering'

  has_many :challenge_question_pairings,
           -> { order('challenge_question_pairings.numbering') }

  validates :checksum,
            :presence => true,
            :uniqueness => true

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
      random_set = list_of_ids.sort { rand() - 0.5 }[0...count] # reference http://stackoverflow.com/a/119250/982802
      list_of_questions = Question.where(id: random_set)

      challenge = Challenge.new(questions: list_of_questions)
    end # while challenge.valid? # checksum invalidates if questions are the same

    challenge
  end

  ########################################
  before_validation :determine_questions,
                    :determine_checksum
  after_create :determine_name
  private

  # Populates with questions
  def determine_questions
    if new_record? and trick and not trick.questions.empty?
      # Number of questions
      count = [trick.questions.count, DEFAULT_QUESTION_COUNT].min

      # generate a random list of questions
      list_of_ids = trick.questions.select('questions.id').to_a
      random_set = list_of_ids.sort { rand() - 0.5 }[0...count] # reference http://stackoverflow.com/a/119250/982802
      list_of_questions = Question.where(id: random_set)

      self.questions = list_of_questions
    end
  end

  def determine_name
    self.name = "Challenge #{id}" #TODO this does not work before it is saved...
    #TODO instead, randomly generate adjective noun pairs, e.g. 'Pretty Pig', 'Soaring Kite'
  end

  def determine_checksum
    if questions and not questions.empty?
      # When challenge is a leaf, generate checksum based on questions
      self.checksum = questions.sort.map { |x| x.id.b(62).to_s(Radix::BASE::B62) }.join('.')
    else
      # Root challenges contain child nodes that contain the actual questions
      # In this case, generate checksum based on child nodes
      self.checksum = "Challenge:#{children.sort.map { |x| x.id.b(62).to_s(Radix::BASE::B62) }.join('.')}"
    end
  end

end
