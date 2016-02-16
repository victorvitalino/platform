class CreateHelpdeskTicketTypes < ActiveRecord::Migration
  def change
    create_table :helpdesk_ticket_types do |t|
      t.references :sector, index: true#, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
