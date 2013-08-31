class AddHintToTricks < ActiveRecord::Migration
  def change
    add_column :tricks, :hint, :text
  end
end
