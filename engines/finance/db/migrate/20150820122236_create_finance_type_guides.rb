class CreateFinanceTypeGuides < ActiveRecord::Migration
  def change
    create_table :finance_type_guides do |t|
      t.string :title
      t.boolean :publish, default: true
      t.float :value
      t.string :code
      t.timestamps null: false
    end
  end
end
