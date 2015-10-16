class CreateCandidateCadastreAddresses < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_addresses do |t|

      t.timestamps null: false
    end
  end
end
