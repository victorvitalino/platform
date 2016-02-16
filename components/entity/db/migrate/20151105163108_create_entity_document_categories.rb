class CreateEntityDocumentCategories < ActiveRecord::Migration
  def change
    create_table :entity_document_categories do |t|
      t.string :name 
      t.text :description
      t.integer :code
      t.boolean :required, default: false
      t.integer :document_type, default: 0
      t.boolean :status, default: true
      t.timestamps null: false
    end

     add_index :entity_document_categories, :code, unique: true
  end
end
