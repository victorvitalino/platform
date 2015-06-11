class CreatePatrimonyDrives < ActiveRecord::Migration
  def change
    create_table :patrimony_drives do |t|
      t.date :date_drive
      t.integer :sector_old
      t.integer :user_old
      t.references :sector, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :good, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
