class CreateProtocolControlRoutes < ActiveRecord::Migration
  def change
    create_table :protocol_control_routes do |t|
      t.boolean :responded
      t.boolean :bureau_route
      t.boolean :conduct
      t.boolean :link
      t.boolean :redistribuited
      t.boolean :need_answer
      t.boolean :finalized
      t.references :route_sector, index: true#, foreign_key: true
      t.references :route_staff, index: true#, foreign_key: true
      t.date :route_sector_date
      t.string :redistribuited_to
      t.references :control, index: true#, foreign_key: true

      t.timestamps null: false
    end
  end
end
