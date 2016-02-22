module Concourse
  class ProjectPolicy < ApplicationPolicy

    def index?
      allow?(21104)
    end

    def new?
      allow?(21101)
    end

    def edit?
      allow?(21102)
    end

    def destroy?
      allow?(21103)
    end
  end
end