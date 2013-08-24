class Lesson < ActiveRecord::Base
  include RankedModel
  ranks :numbering,
        :with_same => :course_id

  belongs_to :course
end
