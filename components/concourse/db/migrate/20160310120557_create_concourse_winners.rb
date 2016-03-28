class CreateConcourseWinners < ActiveRecord::Migration
  def change
    create_table :concourse_winners do |t|
      t.references :participation, index: true#, foreign_key: true
      t.references :candidate, index: true#, foreign_key: true
      t.integer :position
      t.references :project, index: true#, foreign_key: true
      t.references :subscribe, index: true#, foreign_key: true
      t.integer :winner_type, default: 0

      t.timestamps null: false
    end

  end
end
