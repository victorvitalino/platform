class CreateCoreSubnavs < ActiveRecord::Migration
  def change
    create_table :core_subnavs do |t|
      t.string :name
      t.text :description
      t.string :url
      t.boolean :status
      t.string :code
      t.references :nav, index: true#, foreign_key: true
      t.references :subnav, index: true#, foreign_key: true
      t.boolean :only_admin
      t.references :staff, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
