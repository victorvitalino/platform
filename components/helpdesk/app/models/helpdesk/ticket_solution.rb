module Helpdesk
  class TicketSolution < ActiveRecord::Base
    belongs_to :ticket_type
    has_many :ticket_solution


    validates :solution, presence: true

  end
end
