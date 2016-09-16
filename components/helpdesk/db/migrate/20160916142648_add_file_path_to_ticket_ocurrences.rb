class AddFilePathToTicketOcurrences < ActiveRecord::Migration
  def change
    add_column :helpdesk_ticket_ocurrences, :file_ocurrence, :string
  end
end
