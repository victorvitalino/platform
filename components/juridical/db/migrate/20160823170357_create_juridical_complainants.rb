class CreateJuridicalComplainants < ActiveRecord::Migration
  def change
    create_table :juridical_complainants do |t|
      t.string :name
      t.references :staff, index: true#, foreign_key: true
      t.references :legal_advice, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
