class CreateFinanceBankSlips < ActiveRecord::Migration
  def change
    create_table :finance_bank_slips do |t|
      t.references :type_slip, index: true#, foreign_key: true
      t.float :value
      t.date :deadline
      t.date :paid
      t.date :credited
      t.float :value_paid
      t.string :barcode
      t.string :observation
      t.string :name
      t.string :cpf
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
