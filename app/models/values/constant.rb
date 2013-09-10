class Constant < ActiveRecord::Base
  validates :name,
            :uniqueness => true

  validates :value,
            :uniqueness => true

  validates :html,
            :uniqueness => true

  validates :plain_text,
            :uniqueness => true

  def to_s
    name
  end

  def symbol
    html
  end

  def self.build(name_plain_text, symbol_html, value)
    where(name: name_plain_text, plain_text: name_plain_text, html: symbol_html, value: value).first_or_create
  end
end
