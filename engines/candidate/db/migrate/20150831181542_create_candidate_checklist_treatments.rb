class CreateCandidateChecklistTreatments < ActiveRecord::Migration
  def change
    create_table :candidate_checklist_treatments do |t|
      t.references :checklist, index: true#, foreign_key: true
      t.references :attendance_cadastre, index: true#, foreign_key: true
      t.references :attendant, index: true
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
