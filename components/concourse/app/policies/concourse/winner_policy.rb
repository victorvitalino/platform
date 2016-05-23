module Concourse
  class WinnerPolicy < ApplicationPolicy

    def index?
      allow?(21133)
    end

    def create?
      allow?(21133)
    end

    def update?
      allow?(21133)
    end

    def destroy?
      allow?(21133)
    end
  end
end