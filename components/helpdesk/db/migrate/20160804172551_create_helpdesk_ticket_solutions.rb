class CreateHelpdeskTicketSolutions < ActiveRecord::Migration
  def change
    create_table :helpdesk_ticket_solutions do |t|
      t.references :ticket_type, index: true#, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :status
      t.string :solution_sla 

      t.timestamps null: false
    end
  end
end
