class CreateHelpdeskTickets < ActiveRecord::Migration
  def change
    create_table :helpdesk_tickets do |t|
      t.references :ticket_type, index: true#, foreign_key: true
      t.references :requester, index: true#, foreign_key: true
      t.references :attendant, index: true#, foreign_key: true
      t.references :ticket_subject, index: true#, foreign_key: true
      t.references :sector, index: true#, foreign_key: true
      t.datetime :attendance_start
      t.datetime :attendance_end
      t.datetime :deadline
      t.integer :status, default: 0
      t.text :description
      t.text :meta_tags

      t.timestamps null: false
    end
  end
end
