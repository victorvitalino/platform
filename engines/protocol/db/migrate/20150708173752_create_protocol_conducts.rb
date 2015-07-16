class CreateProtocolConducts < ActiveRecord::Migration
  def change
    create_table :protocol_conducts do |t|
      t.date :receipt_date
      t.date :term_response_date
      t.references :assessment, index: true, foreign_key: true
      t.references :sector_send, index: true, foreign_key: true
      t.references :user_send, index: true, foreign_key: true
      t.references :sector_receptor, index: true, foreign_key: true
      t.string :user_receptor
      t.references :allotment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
