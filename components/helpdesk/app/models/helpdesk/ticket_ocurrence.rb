module Helpdesk
  class TicketOcurrence < ActiveRecord::Base
    belongs_to :ticket
    belongs_to :staff
    belongs_to :responsible,-> { joins('inner join helpdesk_ticket_attendants on person_staffs.id = helpdesk_ticket_attendants.staff_id') }, class_name: "Helpdesk::Staff"
    belongs_to :ticket_solution

    def self.create_ocurrence(ticket, user,ocurrence)
      ocurrence = TicketOcurrence.new
      ocurrence.ticket_id = ticket
      ocurrence.staff_id = user
      ocurrence.ocurrence = ocurrence
      ocurrence.save
    end

  end
end
