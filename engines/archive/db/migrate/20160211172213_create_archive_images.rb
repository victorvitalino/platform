class CreateArchiveImages < ActiveRecord::Migration
  def change
    create_table :archive_images do |t|
      t.references :staff,  index: true 
      t.references :sector, index: true 
      
      t.string  :original_name
      t.string  :description

      t.string  :hash_name 
      t.string  :file_path

      t.timestamps null: false
    end

    add_index :archive_images, :hash_name, unique: true
    add_index :archive_images, :file_path, unique: true

  end
end
