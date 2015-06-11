class CreatePatrimonySerialNumbers < ActiveRecord::Migration
  def change
    create_table :patrimony_serial_numbers do |t|
      t.string :name
      t.string :number
      t.references :good, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
