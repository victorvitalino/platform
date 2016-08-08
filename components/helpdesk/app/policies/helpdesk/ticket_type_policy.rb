module Helpdesk
  class TicketTypePolicy < ApplicationPolicy
    def index?
      allow?(41410)
    end

    def create?
      allow?(41411)
    end

    def update?
      allow?(41412)
    end

    def destroy?
      allow?(41413)
    end
  end
end
