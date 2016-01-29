class CreateCandidateSituationCadastreAddresses < ActiveRecord::Migration
  def change
    create_table :candidate_situation_cadastre_addresses do |t|
      t.string :title
      t.text :description
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
