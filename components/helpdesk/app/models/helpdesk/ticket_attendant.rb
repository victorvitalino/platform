module Helpdesk
  class TicketAttendant < ActiveRecord::Base
    belongs_to :ticket_type
    belongs_to :staff, -> { where(status: true).order(:name) }    

    validates :staff_id, presence: true, uniqueness:  {scope: :ticket_type_id}
  end
end
