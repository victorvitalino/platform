module Concourse
  class ConsultPolicy < ApplicationPolicy

    def index?
      allow?(21105)
    end

    def new?
      false
    end

    def edit?
      allow?(21106)
    end

    def destroy?
      false
    end
  end
end