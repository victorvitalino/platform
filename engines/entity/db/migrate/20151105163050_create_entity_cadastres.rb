class CreateEntityCadastres < ActiveRecord::Migration
  def change
    create_table :entity_cadastres do |t|
      t.string :cnpj
      t.string :name
      t.string :fantasy_name
      t.string :telephone
      t.string :telephone_optional
      t.string :email 
      t.string :celphone
      t.string :address
      t.string :number
      t.string :complement
      t.string :cep 
      t.references :city, index: true
      t.text  :observation
      t.boolean :status, default: true
      
      t.string :password
      t.string :reset_token

      t.timestamps null: false
    end
    add_index :entity_cadastres, :cnpj, unique: true
    add_index :entity_cadastres, :email, unique: true
    add_index :entity_cadastres, :reset_token, unique: true

  end
end
