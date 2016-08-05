class CreateHelpdeskTicketOcurrences < ActiveRecord::Migration
  def change
    create_table :helpdesk_ticket_ocurrences do |t|
      t.references :ticket, index: true#, foreign_key: true
      t.references :staff, index: true#, foreign_key: true
      t.references :responsible, index: true#, foreign_key: true
      t.text :ocurrence
      t.references :ticket_solution, index: true#, foreign_key: true
      t.text :description_solution
      t.datetime :solution_date
      t.datetime :scheduled_date
      t.boolean :scheduled

      t.timestamps null: false
    end
  end
end
