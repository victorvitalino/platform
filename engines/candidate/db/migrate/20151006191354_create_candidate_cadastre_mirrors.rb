class CreateCandidateCadastreMirrors < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_mirrors do |t|
      t.string :name
      t.string :cpf, null: false, default: ""#, index: true
      t.integer :gender
      t.date :born
      t.string :born_uf
      t.string :rg
      t.string :rg_org
      t.string :rg_uf
      t.string :place_birth
      t.date :arrival_df
      t.string :telephone
      t.string :telephone_optional
      t.string :celphone
      t.string :email
      t.references :special_condition, index: true#, foreign_key: true
      t.string :cep
      t.references :city, index: true#, foreign_key: true
      t.references :state, index: true#, foreign_key: true
      t.string :address
      t.string :address_complement
      t.float :income
      t.string :work_cep
      t.references :work_city, index: true#, foreign_key: true
      t.string :work_address
      t.string :nis
      t.string :cid
      t.references :civil_state, index: true#, foreign_key: true
      t.boolean :special_condition_flag
      t.references :program, index: true#, foreign_key: true
      t.boolean :adapted_property
      
      t.references :cadastre, index: true
      t.integer :cadastre_type, default: 0

      t.timestamps null: false
    end


    add_index :candidate_cadastre_mirrors, :cpf, unique: true

  end
end
