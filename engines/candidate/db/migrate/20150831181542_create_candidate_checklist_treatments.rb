class CreateCandidateChecklistTreatments < ActiveRecord::Migration
  def change
    create_table :candidate_checklist_treatments do |t|
      t.boolean :status
      t.references :checklist, index: true#, foreign_key: true
      t.references :attendance_cadastre, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
