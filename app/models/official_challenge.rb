class OfficialChallenge < ActiveRecord::Base
  extend ::Enumerize

  enumerize :grade_level,
            :in => {
                elementary: 5,
                middle: 8,
                high: 12,
            },
            :default => :elementary

  enumerize :difficulty,
            :in => {
                easy: 100,
                normal: 200,
                hard: 300,
            },
            :default => :normal

  mount_uploader :upload, DocumentUploader


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
