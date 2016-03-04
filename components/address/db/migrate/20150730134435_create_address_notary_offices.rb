class CreateAddressNotaryOffices < ActiveRecord::Migration
  def change
    create_table :address_notary_offices do |t|
      t.string :unit_code
      t.string :office
      t.date :date_code
      t.date :date_contract
      t.string :code_contract
      t.string :office_contract
      t.date :date_petition
      t.date :date_signature
      t.date :date_anoreg
      t.date :date_devolution
      t.string :requeriment
      t.date :date_requeriment
      t.string :declaratory_act_number
      t.string :rejection_number
      t.references :unit, index: true#, foreign_key: true
      t.date :date_act_declaratory
      t.date :date_act_rejection

      t.timestamps null: false
    end
  end
end
