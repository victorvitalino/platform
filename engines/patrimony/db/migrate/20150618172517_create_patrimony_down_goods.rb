class CreatePatrimonyDownGoods < ActiveRecord::Migration
  def change
    create_table :patrimony_down_goods do |t|
      t.string :name
      t.string :number_process
      t.string :description
      t.boolean :status
      t.timestamps null: false
    end
  end
end
