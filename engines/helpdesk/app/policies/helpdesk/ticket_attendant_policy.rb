module Helpdesk
  class TicketAttendantPolicy < ApplicationPolicy
    def index?
      allow?(5204)
    end

    def create?
      allow?(5203)
    end

    def update?
      allow?(5203)
    end

    def destroy?
      allow?(5203)
    end
  end
end
