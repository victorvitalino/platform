module Helpdesk
  class TicketComment < ActiveRecord::Base
    belongs_to :ticket
  end
end
