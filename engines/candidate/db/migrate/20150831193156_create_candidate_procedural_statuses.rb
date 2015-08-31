class CreateCandidateProceduralStatuses < ActiveRecord::Migration
  def change
    create_table :candidate_procedural_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
