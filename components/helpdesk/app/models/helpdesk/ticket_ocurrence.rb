module Helpdesk
  class TicketOcurrence < ActiveRecord::Base
    belongs_to :ticket
    belongs_to :staff
    belongs_to :responsible,-> { joins('inner join helpdesk_ticket_attendants on person_staffs.id = helpdesk_ticket_attendants.staff_id') }, class_name: "Helpdesk::Staff"
    belongs_to :ticket_solution




    def ticket_solution_title
      ticket_solution.try(:title)
    end

    def ticket_solution_title=(title)
      if title.present? && self.ticket_id.present?
        ticket = Helpdesk::Ticket.find(ticket_id)
        self.ticket_solution = Helpdesk::TicketSolution.find_or_create_by(title: title, ticket_type_id: ticket.ticket_type_id)
      end
    end


  end
end
