class CreateCandidateAdjuctCadastres < ActiveRecord::Migration
  def change
    create_table :candidate_adjuct_cadastres do |t|

      t.string      :name
      t.string      :telephone
      t.string      :telephone_optional
      t.string      :celphone
      t.string      :email
      t.references  :special_condition, index: true
      t.boolean     :flag_special_condition, default: false
      t.string      :cep
      t.references  :city, index: true
      t.references  :state, index: true 
      t.string      :address
      t.string      :adjunt_address
      t.string      :number_address
      t.float       :income
      t.string      :work
      t.string      :cep_work
      t.references  :city_work, index: true
      t.references  :state_work, index: true
      t.string      :address_work
      t.string      :adjunt_address_work
      t.string      :number_address_work
      t.string      :nis, unique: true
      t.string      :cid, unique: true
      t.references  :cadastre, index: true
      t.references  :civil_state, index: true



      t.timestamps null: false
    end
  end
end
