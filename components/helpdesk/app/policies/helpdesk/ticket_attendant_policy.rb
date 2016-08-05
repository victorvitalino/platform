module Helpdesk
  class TicketAttendantPolicy < ApplicationPolicy
    def index?
      allow?(41406)
    end

    def create?
      allow?(41407)
    end

    #def update?
      #allow?(5203)
  #  end

    def destroy?
      allow?(41408)
    end
  end
end
