class CreateBackgroundJobs < ActiveRecord::Migration
  def change
    create_table :background_jobs do |t|
      t.string :name
      t.text :description
      t.integer :progress, default: 0
      t.integer :total, default: 0
      t.boolean :in_progress

      t.timestamps
    end
  end
end
