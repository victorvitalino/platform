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


  end
end
