class CreateCandidateKins < ActiveRecord::Migration
  def change
    create_table :candidate_kins do |t|
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :rg_org
      t.string :rg_uf
      t.date :born
      t.string :gender
      t.string :place_birth
      t.boolean :status
      t.boolean :flag_special_condition
      t.references :adjunct_cadastre, index: true
      t.references :special_condition, index: true

      t.timestamps null: false
    end
  end
end
