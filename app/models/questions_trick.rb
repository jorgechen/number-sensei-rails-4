# Relationship between question and trick
class QuestionsTrick < ActiveRecord::Base
  belongs_to :question
  belongs_to :trick

  validates :question_id,
            :uniqueness => {:scope => :trick_id}
end