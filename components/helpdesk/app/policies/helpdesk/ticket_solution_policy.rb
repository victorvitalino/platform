module Helpdesk
  class TicketSolutionPolicy < ApplicationPolicy
    def index?
      allow?(41404)
    end

    def create?
      allow?(41404)
    end

    def update?
      allow?(41405)
    end

  end
end
