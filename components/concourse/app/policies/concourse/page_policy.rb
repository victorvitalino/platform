module Concourse
  class PagePolicy < ApplicationPolicy

    def index?
      allow?(21110)
    end

    def create?
      allow?(21110)
    end

    def update?
      allow?(21110)
    end

    def destroy?
      allow?(21110)
    end
  end
end