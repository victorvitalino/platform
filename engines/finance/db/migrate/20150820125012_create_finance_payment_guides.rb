class CreateFinancePaymentGuides < ActiveRecord::Migration
  def change
    create_table :finance_payment_guides do |t|
      t.references :type_guide, index: true#, foreign_key: true
      t.float :value
      t.date :deadline
      t.date :paid
      t.date :credited
      t.float :value_paid
      t.string :barcode
      t.string :our_number, unique: true
      t.string :observation
      t.string :name
      t.string :cpf
      t.boolean :status, default: false
      t.integer :model_guide, default: 0

      t.timestamps null: false
    end
  end
end
