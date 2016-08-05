module Helpdesk
  class TicketOcurrencePolicy < ApplicationPolicy

    def create?
      allow?(41404)
    end

    def update?
      allow?(41405)
    end

    def scheduled?
      allow?(41409)
    end

  end
end
