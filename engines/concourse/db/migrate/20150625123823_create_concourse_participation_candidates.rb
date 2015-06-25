class CreateConcourseParticipationCandidates < ActiveRecord::Migration
  def change
    create_table :concourse_participation_candidates do |t|
      t.references :participation, index: true, foreign_key: true
      t.references :candidate, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.text :candidate_attributes
      t.integer :status

      t.timestamps null: false
    end
  end
end
