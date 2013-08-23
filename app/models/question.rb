class Question < ActiveRecord::Base

  has_and_belongs_to_many :tricks

  belongs_to :expression

  belongs_to :answer,
             :class_name => 'Expression',
             :foreign_key => 'answer_id'
end
