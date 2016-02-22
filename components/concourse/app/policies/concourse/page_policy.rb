module Concourse
  class PagePolicy < ApplicationPolicy

    def index?
      allow?(21113)
    end

    def new?
      allow?(21110)
    end

    def edit?
      allow?(21110)
    end

    def destroy?
      allow?(21110)
    end
  end
end