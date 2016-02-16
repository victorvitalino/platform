module Concourse
  class ConsultPolicy < ApplicationPolicy

    def index?
        allow?(21105)
    end

    def create?
        allow?(21106)
    end

    def update?
        allow?(21106)
    end

    def destroy?
        allow?(21106)
    end
  end
end