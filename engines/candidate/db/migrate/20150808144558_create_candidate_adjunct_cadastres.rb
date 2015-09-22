class CreateCandidateAdjunctCadastres < ActiveRecord::Migration
  def change
    create_table :candidate_adjunct_cadastres do |t|
      
      t.boolean     :flag_special_condition, default: false
      t.float       :income
      t.string      :nis, unique: true
      t.string      :cid, unique: true
      t.references  :cadastre, index: true
      t.references  :special_condition, index: true
      t.references  :civil_state, index: true

      t.timestamps null: false
    end
  end
end
