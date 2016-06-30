class CreateSefazExemptions < ActiveRecord::Migration
  def change
    create_table :sefaz_exemptions do |t|
      t.string :sector
      t.string :exemption_type
      t.string :cnpj_notifiers
      t.string :notifiers
      t.string :name
      t.string :cpf
      t.string :city
      t.string :address
      t.string :realty_number
      t.string :realty_value
      t.references :send_status, index: true#, foreign_key: true
      t.integer :allotment
      t.string :return_protocol
      t.string :act_number
      t.datetime :send_date
      t.string :error_message
      t.integer :year_act
      t.string :type_ask
      t.references :staff, index: true#, foreign_key: true
      t.references :staff_send, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
