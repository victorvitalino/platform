class CreateConcourseCandidates < ActiveRecord::Migration
  def change
    create_table :concourse_candidates do |t|
      t.string :name
      t.string :cpf
      t.string :address
      t.string :burgh
      t.string :number
      t.string :city
      t.string :cep
      t.string :telephone
      t.string :celphone
      t.string :email
      t.string :fantasy_name
      t.string :social_reason
      t.string :cnpj
      t.references :state, index: true#, foreign_key: true
      t.string :password
      t.boolean :terms_use
      t.datetime :last_sign_in_at
      t.boolean :homologation, default: false
      t.date :homologation_date
      t.boolean :refused, default: false
      t.date :refused_date
      t.text :observation
      t.references :subscribe, index: true

      t.timestamps null: false
    end
  end
end
