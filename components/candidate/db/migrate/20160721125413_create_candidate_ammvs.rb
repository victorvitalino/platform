class CreateCandidateAmmvs < ActiveRecord::Migration
  def change
    create_table :candidate_ammvs do |t|

      t.string  :cpf
      t.string  :name 
      t.string  :address
      t.string  :unit 
      t.string  :singnature_date 
      t.string  :register_date 
      t.string  :constructor
      t.string  :finance_agent
      t.string  :cdru
      t.string  :cdru_observation
      t.integer :unit_id, index: true 
      t.integer :cadastre_id, index: true 
      t.integer :index_migrate

      t.timestamps null: false
    end
  end
end
