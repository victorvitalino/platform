class CreateCandidateCadastreAddresses < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_addresses do |t|
      t.references :cadastre, index: true
      t.references :cadastre_mirror, index: true
      t.references :unit, index: true
      t.integer :dominal_chair
      t.integer :type_receiving
      t.integer :type_occurence
      t.text :observation

      t.timestamps null: false
    end
  end
end
