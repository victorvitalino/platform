module Helpdesk
  class TicketPolicy < ApplicationPolicy
    def index?
      allow?(5101)
    end

    def create?
      true
    end

    def update?
      true
    end

    def destroy?
      allow?(5102)
    end
  end
end
