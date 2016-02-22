module Concourse
  class NavPolicy < ApplicationPolicy

    def index?
      allow?(21115)
    end

    def new?
      allow?(21114)
    end

    def edit?
      allow?(21114)
    end

    def destroy?
      allow?(21114)
    end
  end
end