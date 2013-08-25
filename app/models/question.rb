class Question < ActiveRecord::Base

  has_and_belongs_to_many :tricks

  belongs_to :expression

  belongs_to :answer,
             :class_name => 'Expression',
             :foreign_key => 'answer_id'


  validates :html,
            :presence => true,
            :uniqueness => true

  validates :plain_text,
            :presence => true,
            :uniqueness => true

  validates :answer_html,
            :presence => true,
            :uniqueness => true

  validates :answer_plain_text,
            :presence => true,
            :uniqueness => true

end
