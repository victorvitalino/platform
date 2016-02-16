module Concourse
  class CandidatePolicy < ApplicationPolicy

    def index?
      true
    end

    def create?
      false
    end

    def update?
      true
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