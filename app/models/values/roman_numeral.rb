class RomanNumeral < ActiveRecord::Base
  validates :value,
            format: { with: /[IVXLCDM]+/},
            :presence => true,
            :uniqueness => true

  def self.build(value)
    if value.is_a?(Integer)
      roman = RomanNumerals.to_roman(value)
    else
      roman = value
    end

    where(value: roman).first_or_initialize
  end

end
