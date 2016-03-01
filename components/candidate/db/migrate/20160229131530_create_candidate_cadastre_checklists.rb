class CreateCandidateCadastreChecklists < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_checklists do |t|
      t.references :cadastre_mirror, index: true#, foreign_key: true
      t.references :checklist, index: true#, foreign_key: true
      t.boolean :document_authenticate
      t.string :document_file
      t.text :description

      t.timestamps null: false
    end
  end
end
