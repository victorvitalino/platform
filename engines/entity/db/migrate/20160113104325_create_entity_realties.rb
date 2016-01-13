class CreateEntityRealties < ActiveRecord::Migration
  def change
    create_table :entity_realties do |t|
      t.references :cadastre, index: true#, foreign_key: true
      t.references :cadastre_mirror, index: true#, foreign_key: true
      t.string :address
      t.references :city, index: true#, foreign_key: true
      t.string :complement
      t.string :number
      t.string :burgh
      t.string :observation
      t.integer :situation

      t.timestamps null: false
    end
  end
end
