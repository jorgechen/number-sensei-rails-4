class Challenge < ActiveRecord::Base

  DEFAULT_QUESTION_COUNT = 40

  # Challenge is a hierarchical tree
  acts_as_tree with_advisory_lock: false

  has_many :challenge_attempts

  has_many :questions,
           :through => :challenge_question_pairings

  has_many :challenge_question_pairings,
           -> { order('challenge_question_pairings.numbering') },
           :dependent => :destroy

  validates :checksum,
            :presence => true,
            :uniqueness => true

  #TODO Aesthetically, give each (root) challenge a name
  #validates :name,
  #          :presence => true,
  #          :uniqueness => true

  #@param answer_attempt_hash given in the form {question_id: {answer: '', order: 1}}
  #@param user_id
  #@return [ChallengeAttempt] Or nil if it failed to save.
  def attempt(answer_attempt_hash, user_id)

    result = nil

    #TODO better validation for answer_attempt_hash
    if User.exists?(user_id) and answer_attempt_hash

      challenge_attempt = ChallengeAttempt.new(user_id: user_id, challenge_id: self.id)

      # Iterate through questions
      questions.each do |q|

        h = answer_attempt_hash[q.id]
        answer = h[:answer]

        qa = QuestionAttempt.new(
            challenge_attempt: challenge_attempt,
            question_id: q.id,
            user_id: user_id,
            order: h[:order],
            answer: answer
        )

        unless answer.blank?
          qa.result = q.attempt_to_solve(answer) ? :correct : :missed
        end

        #TODO assign skipped to certain cases

        qa.save
      end

      if challenge_attempt.save
        result = challenge_attempt
      end
    end

    result
  end


  #@return If the challenge is a composition of other challenges.
  def mixed?
    root? and not children.empty?
  end

  #@return If this is a challenge with a single trick
  def single?
    questions and not questions.empty? and leaf?
  end

  def all_questions
    Question.joins(:challenges).where('challenges.id' => self_and_descendants.select(:id))
  end


  #@return A new mixed challenge
  def self.create_mixed(challenge_id_list)
    c = Challenge.new
    c.add_child Challenge.find(challenge_id_list)
    c.save
    c
  end


  #@return
  def self.make_by_trick(trick, requested_question_count = DEFAULT_QUESTION_COUNT)
    # Number of questions
    count = [trick.questions.count, requested_question_count].min

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

  attr_accessor :question_count
  attr_accessor :trick_id

  #@override getter
  def question_count
    if @question_count and @question_count.to_i > 0
      @question_count.to_i
    else
      DEFAULT_QUESTION_COUNT
    end
  end

  ########################################
  before_validation :determine_questions,
                    :determine_checksum
  after_create :determine_name
  private

  # Populates with questions
  def determine_questions
    if new_record?

      if trick_id
        trick = Trick.find(trick_id)
        count = [trick.questions.count, self.question_count].min
        list_of_ids = trick.questions.select('questions.id').to_a
      else
        count = [Question.count, self.question_count].min
        list_of_ids = Question.joins(:tricks).uniq.select('questions.id').to_a
      end

      random_set = list_of_ids.sort { rand() - 0.5 }[0...count] # reference http://stackoverflow.com/a/119250/982802
      list_of_questions = Question.where(id: random_set)

      self.questions = list_of_questions.order(:id)
    end
  end

  def determine_name
    #TODO instead, randomly generate adjective noun pairs, e.g. 'Pretty Pig', 'Soaring Kite'
    #self.name = "Challenge #{id}"
    #save #TODO error occurs where saving causes self to be cleared in challenge_hierarchy?!
  end

  def determine_checksum
    if single?
      # When challenge is a leaf, generate checksum based on questions
      self.checksum = self.questions.map { |x| x.id.b(62).to_s(Radix::BASE::B62) }.join('.')
    elsif mixed?
      # Root challenges contain child nodes that contain the actual questions
      # In this case, generate checksum based on child nodes
      self.checksum = children.sort.map { |x| x.id.b(62).to_s(Radix::BASE::B62) }.join('-')
      #NOTE: children.order(:id) does not seem to work when creating new mixed challenge
    end
    # Otherwise challenge might be invalid, e.g. there were no questions found
  end

end
