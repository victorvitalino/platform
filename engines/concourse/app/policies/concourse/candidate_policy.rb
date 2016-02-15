module Concourse
  class CandidatePolicy < ApplicationPolicy

    def index?
      allow?(21107)
    end

    def create?
      false
    end

    def update?
      allow?(21108) || allow?(21109)
    end

    def destroy?
      false
    end

    def participation?
    end

    def winner?
    end

  end
end