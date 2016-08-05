class CreateHelpdeskTicketSubjects < ActiveRecord::Migration
  def change
    create_table :helpdesk_ticket_subjects do |t|
      t.references :ticket_type, index: true#, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :status
      t.string :subject_sla

      t.timestamps null: false
    end
  end
end
