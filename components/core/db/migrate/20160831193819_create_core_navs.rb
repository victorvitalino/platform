class CreateCoreNavs < ActiveRecord::Migration
  def change
    create_table :core_navs do |t|
      t.integer :order
      t.string :name
      t.text :description
      t.boolean :status
      t.boolean :only_admin
      t.integer :code
      t.references :system_module, index: true#, foreign_key: true
      t.references :staff, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
