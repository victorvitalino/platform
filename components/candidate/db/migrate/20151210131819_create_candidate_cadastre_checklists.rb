class CreateCandidateCadastreChecklists < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_checklists do |t|
      t.references :cadastre, index: true
      t.references :attendance, index: true
      t.references :checklist, array: true

      t.timestamps null: false
    end
  end
end
