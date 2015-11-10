class CreateEntityDocuments < ActiveRecord::Migration
  def change
    create_table :entity_documents do |t|
      
      t.string :archive_path
      
      t.references :document_category, index: true
      t.references :cadastre, index: true
      t.references :cadastre_mirror, index: true
      
      t.text :observation

      t.timestamps null: false
    end
  end
end
