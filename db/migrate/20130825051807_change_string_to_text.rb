class ChangeStringToText < ActiveRecord::Migration
  def change
    # In PostgreSQL, use text instead of string inconsequentially
    # SOURCE: http://stackoverflow.com/a/3354762/982802
    change_column :questions, :html, :text
    change_column :questions, :plain_text, :text
    change_column :questions, :answer_html, :text
    change_column :questions, :answer_plain_text, :text
  end
end
