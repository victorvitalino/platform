class CreateCandidateCadastres < ActiveRecord::Migration
  def change
    create_table :candidate_cadastres do |t|

      t.string  :cpf, unique: true
      t.integer :gender, default: 0
      t.date    :born
      t.string  :born_uf
      t.string      :rg
      t.string      :rg_org
      t.string      :place_birth
      t.date        :arrival_df
      t.string      :seqcad

      t.timestamps null: false
    end
  end
end
