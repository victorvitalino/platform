class CreateBrbInvoices < ActiveRecord::Migration
  def change
    create_table :brb_invoices do |t|
      t.references :category, index: true
     
      t.string :barcode
      t.string :barcode_with_format
      t.string :bank_agency
      t.string :bank_account
      t.string :cpf
      t.string :name
      t.string :address
      t.references :state, index: true
      t.references :city, index: true
      t.string :cep
      t.integer :type_person, default: 0
      t.integer :modality, default: 0
      t.integer :type_document, default: 0

      t.string :code 

      t.date  :due
      t.float :value, default: 0.0

      t.text :message

      t.date :payment
      t.integer :status, default: 0
      t.boolean :remittance, dafault: false
      t.text :bank_return

      t.string :wallet
      t.string :sequential_without_digit
      t.string :sequential_digit_one
      t.string :sequential_digit_two

      t.timestamps null: false
    end

    add_index :brb_invoices, :code, unique: true
  end
end
