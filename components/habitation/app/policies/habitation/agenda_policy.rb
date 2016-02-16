module Habitation
  class AgendaPolicy < ApplicationPolicy
    def index?
      allow?(15101)
    end

    def create?
      allow?(150105)
    end

    def update?
      allow?(150102)
    end

    def destroy?
      allow?(150103)
    end

    def publish?
      allow? (150104)
    end
  end
end
