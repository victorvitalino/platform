class CreateSefazExemptions < ActiveRecord::Migration
  def change
    create_table :sefaz_exemptions do |t|
      t.string :name
      t.string :cpf
      t.string :city
      t.string :address
      t.string :realty_number
      t.string :realty_value
      t.references :allotment, index: true#,
      t.string :act_number
      t.boolean :canceled
      t.datetime :canceled_date
      t.references :canceled_staff, index: true#,
      t.text :return_message
      t.references :staff, index: true
      t.boolean :unitary

      t.timestamps null: false
    end
  end
end
