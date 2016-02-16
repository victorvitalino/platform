module Candidate
  class CadinPolicy < ApplicationPolicy

    def view_nav?
      self.index? || self.seat?
    end

    def index?
      allow?(11304)
    end

    def create?
      allow?(11301)
    end

    def update?
      allow?(11302)
    end

    def destroy?
      allow?(11303)
    end

  end
end
