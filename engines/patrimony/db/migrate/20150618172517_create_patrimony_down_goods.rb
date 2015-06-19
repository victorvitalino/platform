class CreatePatrimonyDownGoods < ActiveRecord::Migration
  def change
    create_table :patrimony_down_goods do |t|
      t.string :name
      t.string :number_process
      t.string :description
      t.boolean :status
      t.timestamps null: false
      t.references :good, index: true, foreign_key: true
    end
  end
end
