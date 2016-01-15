class CreateCandidateCadastreLogs < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_logs do |t|
      t.references :staff, index: true#, foreign_key: true
      t.references :cadastre, index: true#@, foreign_key: true
      t.text :cadastre_old
      t.text :cadastre_new

      t.timestamps null: false
    end
  end
end
