class CreateHelpdeskTicketComments < ActiveRecord::Migration
  def change
    create_table :helpdesk_ticket_comments do |t|
      t.references :ticket, index: true#, foreign_key: true
      t.integer :user_type
      t.text :comment
      t.boolean :read
      t.datetime :read_date

      t.timestamps null: false
    end
  end
end
