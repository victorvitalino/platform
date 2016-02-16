class CreateHelpdeskTicketAttendants < ActiveRecord::Migration
  def change
    create_table :helpdesk_ticket_attendants do |t|
      t.references :ticket_type, index: true#, foreign_key: true
      t.references :staff, index: true#, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
