module Concourse
  class ProjectPolicy < ApplicationPolicy

    def index?
      allow?(21104)
    end

    def create?
      allow?(21101)
    end

    def update?
      allow?(21102)
    end

    def destroy?
      allow?(21103)
    end
  end
end