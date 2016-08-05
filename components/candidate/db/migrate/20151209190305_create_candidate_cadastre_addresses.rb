class CreateCandidateCadastreAddresses < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_addresses do |t|
      t.references :cadastre, index: true#, foreign_key: true
      t.references :cadastre_mirror, index: true#, foreign_key: true
      t.references :unit, index: true#, foreign_key: true
      t.string :dominial_chain
      t.integer :type_occurrence
      t.string :observation
      t.integer :type_receipt

      t.timestamps null: false
    end
  end
end
