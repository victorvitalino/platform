class CreateProtocolConducts < ActiveRecord::Migration
  def change
    create_table :protocol_conducts do |t|
      t.date :replay_date
      t.date :description
      t.references :conduct_type, index: true
      t.references :assessment, index: true, foreign_key: true
      t.references :sector, index: true, foreign_key: true
      t.references :staff, index: true, foreign_key: true
      t.references :allotment, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
