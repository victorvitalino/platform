module Schedule
  class AgendaSchedulePolicy < ApplicationPolicy

    def index?
      allow?(118201)
    end

    
    def edit?
      allow?(118202)
    end


  end
end
