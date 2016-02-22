module Concourse
  class SubscribeTypePolicy < ApplicationPolicy

    def index?
      allow?(21122)
    end

    def new?
      allow?(21121)
    end

    def edit?
      allow?(21121)
    end

    def destroy?
      allow?(21121)
    end
  end
end