class CreateProtocolAttachDocuments < ActiveRecord::Migration
  def change
    create_table :protocol_attach_documents do |t|
      t.references :document_father, index: true
      t.references :document_child, index: true
      t.integer :attach_type
      t.references :sector, index: true
      t.references :staff, index: true

      t.timestamps null: false
    end
  end
end
