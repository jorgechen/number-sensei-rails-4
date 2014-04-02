class CreateRomanNumerals < ActiveRecord::Migration
  def change
    create_table :roman_numerals do |t|
      t.string :value

      t.timestamps
    end
  end
end
