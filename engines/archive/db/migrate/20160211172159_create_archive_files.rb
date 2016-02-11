class CreateArchiveFiles < ActiveRecord::Migration
  def change
    create_table :archive_files do |t|
      t.references :staff,  index: true 
      t.references :sector, index: true 
      
      t.string  :original_name
      t.string  :description

      t.string  :hash_name 
      t.string  :file_path
      
      t.boolean    :deleted, default: false 
      t.references :staff_deleted, index: true
      t.datetime   :deleted_at,  index: true

      t.timestamps null: false
    end

    add_index :archive_files, :hash_name, unique: true
    add_index :archive_files, :file_path, unique: true
  end
end
