class Constant < ActiveRecord::Base
  validates :name,
            :uniqueness => true

  validates :value,
            :uniqueness => true

  validates :symbol,
            :uniqueness => true

  def to_s
    name
  end

  def self.build(name_plain_text, symbol_html, value)
    where(name: name_plain_text, symbol: symbol_html, value: value).first_or_create
  end
end
