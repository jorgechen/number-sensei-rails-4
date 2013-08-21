class Constant < ActiveRecord::Base
  validates :name,
            :uniqueness => true

  validates :value,
            :uniqueness => true

  validates :html,
            :uniqueness => true

  validates :plain_text,
            :uniqueness => true
end
