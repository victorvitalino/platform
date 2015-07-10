class CreateHelpdeskOrderServices < ActiveRecord::Migration
  def change
    create_table :helpdesk_order_services do |t|
      t.integer :number
      t.integer :number_increment
      t.string :priority
      t.boolean :status
      t.integer :qualification
      t.string  :subject
      t.references :sector, index: true, foreign_key: true
      t.references :branch_line, index: true, foreign_key: true
      t.references :staff, index: true, foreign_key: true
      t.references :opened_by, index: true, foreign_key: true
      t.references :responsible, index: true, foreign_key: true
      t.references :good, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
