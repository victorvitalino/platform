class CreateCandidateCadastreProcedurals < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_procedurals do |t|
      t.references :cadastre_mirror, index: true
      t.references :cadastre, indeX: true
      t.references :procedural_status, index: true
      t.references :convocation, index: true
      t.references :assessment, index: true

      t.timestamps null: false
    end
  end
end
