class CreateProtocolDocumentTypes < ActiveRecord::Migration
  def change
    create_table :protocol_document_types do |t|
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
