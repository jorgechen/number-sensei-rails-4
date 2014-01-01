class Word < ActiveRecord::Base
  validates :spelling,
            presence: true,
            uniqueness: {scope: :category}
end
