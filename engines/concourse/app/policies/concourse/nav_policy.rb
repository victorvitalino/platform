module Concourse
  class NavPolicy < ApplicationPolicy

    def index?
      allow?(21113)
    end

    def create?
      allow?(21113)
    end

    def update?
      allow?(21113)
    end

    def destroy?
      allow?(21113)
    end
  end
end