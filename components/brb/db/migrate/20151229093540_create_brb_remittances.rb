class CreateBrbRemittances < ActiveRecord::Migration
  def change
    create_table :brb_remittances do |t|
      t.text :content
      t.text :header_content
      t.references :invoices, array: true
      t.boolean :publish, default: false
      t.date :date

      t.timestamps null: false
    end
  end
end
