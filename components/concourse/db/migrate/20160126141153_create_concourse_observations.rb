class CreateConcourseObservations < ActiveRecord::Migration
  def change
    create_table :concourse_observations do |t|
      t.references :candidate, index: true#, foreign_key: true
      t.text :content
      t.integer :message_type
      t.references :staff, index: true

      t.timestamps null: false
    end
  end
end
