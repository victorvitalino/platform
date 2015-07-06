class CreateHelpdeskOrderServices < ActiveRecord::Migration
  def change
    create_table :helpdesk_order_services do |t|
      t.integer :number
      t.integer :number_increment
      t.string :opened_by
      t.string :priority
      t.references :sector, index: true, foreign_key: true
      t.references :branch_line, index: true, foreign_key: true
      t.references :staff, index: true, foreign_key: true
      t.references :good, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
