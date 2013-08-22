class Question < ActiveRecord::Base

  belongs_to :expression

  belongs_to :answer,
             :class_name => 'Expression',
             :foreign_key => 'answer_id'
end
