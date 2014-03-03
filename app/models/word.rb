class Word < ActiveRecord::Base
  validates :spelling,
            uniqueness: {scope: :category},
            format: {with: /\A[a-z ]+\z/}, #lower case and spaces only
            presence: true

  validates :category,
            format: {with: /\A[a-z]+\z/}, #lower case only
            presence: true

  validates :part_of_speech,
            format: {with: /\A[a-z]+\z/}, #lower case only
            presence: true

  before_validation :lower_case_everything

  private
  def lower_case_everything
    self.spelling.downcase!
    self.category.downcase!
    self.part_of_speech.downcase!
  end
end
