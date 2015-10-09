class CreateCandidateDependents < ActiveRecord::Migration
  def change
    create_table :candidate_dependents do |t|
      t.references :cadastre, index: true#, foreign_key: true
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :rg_org
      t.string :rg_uf_id
      t.date :born
      t.integer :gender
      t.string :place_birth
      t.references :civil_state, index: true#, foreign_key: true
      t.float :income
      t.references :kinship, index: true#, foreign_key: true
      t.boolean :co_acquirer, default: false
      t.float :percentage
      t.references :special_condition, index: true#, foreign_key: true
      t.boolean :special_condition_flag, default: false
      t.string :cid
      t.string :nis
      

      t.timestamps null: false
    end
  end
end
