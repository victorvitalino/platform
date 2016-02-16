class CreatePersonSectors < ActiveRecord::Migration
  def change
    create_table :person_sectors do |t|
      t.string :name
      t.string :acron
      t.string :prefex
      t.references :father, index: true#, foreign_key: true
      t.references :responsible, index: true#, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
