module Candidate
  class EnterpriseSituationStatusPolicy < ApplicationPolicy

    def view_nav?
      self.index? || self.seat?
    end

    def index?
      allow?(11602)
    end

    def create?
      allow?(11601)
    end

    def update?
      allow?(11603)
    end

    def destroy?
      allow?(11604)
    end

  end
end
