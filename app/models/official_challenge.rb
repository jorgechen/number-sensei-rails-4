class OfficialChallenge < ActiveRecord::Base
  extend ::Enumerize

  # ATtribute grade_level
  enumerize :grade_level,
            :in => {
                elementary: 5,
                middle: 8,
                high: 12,
            },
            :default => :elementary

  # Attribute difficulty
  enumerize :difficulty,
            :in => {
                easy: 100,
                normal: 200,
                hard: 300,
            },
            :default => :normal

  # Attribute upload
  mount_uploader :upload, DocumentUploader
  validates :upload,
            :presence => true

  # Attribute category
  belongs_to :category,
             :class_name => 'ChallengeCategory',
             :foreign_key => 'category_id'

  # Attribute name
  validates :name,
            :presence => true


  ################################################
  # Class Methods
  ################################################
  SEASON_DATES = {
      spring: '3-20',
      summer: '6-20',
      autumn: '9-20',
      fall: '9-20',
      winter: '12-20',
  }

  def self.season_to_date(season, year)
    begin
      "#{year}-#{SEASON_DATES[season]}".to_date
    rescue => error
      logger.warn "OfficialChallenge::season_to_date() problem: #{error.message}"
      Date.current
    end
  end

end
