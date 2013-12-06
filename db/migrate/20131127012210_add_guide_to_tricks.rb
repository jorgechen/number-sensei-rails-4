class AddGuideToTricks < ActiveRecord::Migration
  def change
    add_column :tricks, :guide, :text
  end
end
