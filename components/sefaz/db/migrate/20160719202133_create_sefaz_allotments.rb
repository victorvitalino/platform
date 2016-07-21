class CreateSefazAllotments < ActiveRecord::Migration
  def change
    create_table :sefaz_allotments do |t|
      t.references :staff, index: true#, foreign_key: true
      t.text :error_message
      t.datetime :send_date
      t.references :send_staff, index: true
      t.string :protocol_return
      t.integer :exemption_type
      t.string :notifiers
      t.string :cnpj_notifiers
      t.text :observation
      t.references :send_status, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
