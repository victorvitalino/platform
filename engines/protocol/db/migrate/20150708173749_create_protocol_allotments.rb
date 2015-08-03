class CreateProtocolAllotments < ActiveRecord::Migration
  def change
    create_table :protocol_allotments do |t|
      t.text :description
      t.integer :priority
      t.date :replay_date
      t.integer :amount_docs
      t.boolean :status, default: :false
      t.references :sector, index: true #, foreign_key: true
      t.references :staff, index: true#, foreign_key: true
      t.timestamps null: false
    end
  end
end
