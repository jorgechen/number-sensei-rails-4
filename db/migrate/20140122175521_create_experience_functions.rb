class CreateExperienceFunctions < ActiveRecord::Migration
  def change
    create_table :experience_functions do |t|
      t.float :coefficient_a
      t.float :coefficient_b
      t.string :type

      t.timestamps
    end

    # add dependence with ExperienceLevel
    add_column :experience_levels, :experience_function_id, :integer
  end
end
