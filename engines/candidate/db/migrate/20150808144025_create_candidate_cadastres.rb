class CreateCandidateCadastres < ActiveRecord::Migration
  def change
    create_table :candidate_cadastres do |t|

      t.string  :cpf, unique: true
      t.integer :gender, default: 0
      
      #junção de tabelas
      t.string      :name
      t.string      :telephone
      t.string      :telephone_optional
      t.string      :celphone
      t.string      :email
      t.string      :cep
      t.references  :city, index: true
      t.references  :state, index: true
      t.string      :address
      t.string      :adjunct_address
      t.string      :number_address
      t.string      :work
      t.string      :cep_work
      t.references  :city_work, index: true
      t.references  :state_work, index: true
      t.string      :address_work
      t.string      :adjunct_address_work
      t.string      :number_address_work
 
      t.date    :born
      t.string  :born_uf
      t.string  :rg
      t.string  :rg_org
      t.string  :place_birth
      t.date    :arrival_df
      t.string  :seqcad
      t.timestamps null: false
    end
  end
end
