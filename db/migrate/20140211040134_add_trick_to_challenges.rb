class AddTrickToChallenges < ActiveRecord::Migration
  def change
    add_reference :challenges, :trick, index: true
  end
end
