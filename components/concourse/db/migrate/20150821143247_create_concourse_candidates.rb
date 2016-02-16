class CreateConcourseCandidates < ActiveRecord::Migration
  def change
    create_table :concourse_candidates do |t|
      t.string :name
      t.string :rg
      t.integer :gender
      t.date :born
      t.string :cpf
      t.string :address
      t.string :burgh
      t.string :city
      t.string :cep
      t.string :telephone
      t.string :celphone
      t.string :email
      t.string :fantasy_name
      t.string :social_reason
      t.string :cnpj
      t.string :password
      t.boolean :terms_use
      t.references :state, index: true#, foreign_key: true
      t.references :subscribe, index: true
      t.text :properties
      t.string :protocol, unique: true
      
      t.text :observation
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
