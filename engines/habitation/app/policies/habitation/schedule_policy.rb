module Habitation
  class SchedulePolicy < ApplicationPolicy
    def index?
      allow?(150201)
    end

    def create?
      false
    end

    def update?
      allow?(150202)
    end

    def destroy?
      false
    end

    def show?
      allow?(150203)
    end
  end
end
