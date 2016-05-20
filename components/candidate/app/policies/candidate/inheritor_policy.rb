module Candidate
  class InheritorPolicy < ApplicationPolicy

    def view_nav?
      self.index? || self.seat?
    end

    def index?
      allow?(11016)
    end

    def create?
      allow?(11017)
    end

    def update?
      allow?(11018)
    end

    def destroy?
      allow?(11019)
    end

  end
end
