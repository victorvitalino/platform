class CreateFinanceTypeSlips < ActiveRecord::Migration
  def change
    create_table :finance_type_slips do |t|
      t.string :title
      t.boolean :publish
      t.float :value
      t.string :code

      t.timestamps null: false
    end
  end
end
