module Schedule
  class AgendaPolicy < ApplicationPolicy

    def index?
      allow?(118103)
    end

    def new?
      allow?(118101)
    end

    def edit?
      allow?(118101)
    end

    def destroy?
      allow?(118102)
    end


  end
end
