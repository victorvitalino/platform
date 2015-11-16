class CreateFirmCompanies < ActiveRecord::Migration
  def change
    create_table :firm_companies do |t|
      t.string :name
      t.string :trade
      t.string :cnpj
      t.string :email
      t.references :city, index: true#, foreign_key: true
      t.string :address
      t.string :adjuntc_address
      t.string :cep
      t.string :telephone
      t.string :telephone_optional
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
