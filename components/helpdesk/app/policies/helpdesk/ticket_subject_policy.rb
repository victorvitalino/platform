module Helpdesk
  class TicketSubjectPolicy < ApplicationPolicy

    def index?
      allow?(41414)
    end

    def create?
      allow?(41415)
    end

    def update?
      allow?(41416)
    end

    def destroy?
      allow?(41417)
    end

  end
end
