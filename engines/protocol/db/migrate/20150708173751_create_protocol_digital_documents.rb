class CreateProtocolDigitalDocuments < ActiveRecord::Migration
  def change
    create_table :protocol_digital_documents do |t|
      t.integer :page_number
      t.string :doc_path
      t.references :assessment, index: true#, foreign_key: true
      t.references :staff, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
