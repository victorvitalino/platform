module Helpdesk
  class TicketTypePolicy < ApplicationPolicy
    def index?
      allow?(5202)
    end

    def create?
      allow?(5201)
    end

    def update?
      allow?(5201)
    end

    def destroy?
      allow?(5201)
    end
  end
end
