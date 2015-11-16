class CreateCandidateCadastreSituations < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_situations do |t|
      t.references  :cadastre_mirror, index: true
      t.references  :cadastre, index: true
      t.references  :situation_status, index: true
      t.timestamps null: false
    end
  end
end
