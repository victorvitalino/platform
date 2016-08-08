module Helpdesk
  class TicketPolicy < ApplicationPolicy
    def index?
      allow?(41401)
    end

    def create?
      allow?(41402)
    end

    def closed?
      allow?(41403)
    end

    def to_attendant?
      allow?(41418)
    end

  end
end
