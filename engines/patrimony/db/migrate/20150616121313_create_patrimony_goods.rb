class CreatePatrimonyGoods < ActiveRecord::Migration
  def change
    create_table :patrimony_goods do |t|
      t.string :code_goods
      t.date :date_acquisition
      t.boolean :status
      t.references :sector, index: true#, foreign_key: true
      t.references :user, index: true#, foreign_key: true
      t.references :material, index: true#, foreign_key: true
      t.references :property, index: true#, foreign_key: true
      t.timestamps null: false
    end
  end
end
