class CreateCandidateKins < ActiveRecord::Migration
  def change
    create_table :candidate_kins do |t|
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :rg_org
      t.string :rg_uf
      t.date   :born
      t.integer :gender, default: 0
      t.string :place_birth
      
      #junção de tabelas
      t.float :income
      t.integer :percent, default: 0
      
      t.references :kin, index: true
      t.references :kinship, index: true

      t.boolean :copurchaser_flag, default: false
      t.boolean :flag_special_condition, default: false

      t.string :cid

      t.references :adjunct_cadastre, index: true
      t.references :special_condition, index: true

      t.boolean :status, default: true
      t.timestamps null: false
    end
  end
end
