class CreateProtocolControls < ActiveRecord::Migration
  def change
    create_table :protocol_controls do |t|
      t.references :assessment, index: true#, foreign_key: true
      t.references :staff, index: true#, foreign_key: true
      t.date :input_doc_date

      t.timestamps null: false
    end
  end
end
