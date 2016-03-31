module Concourse
  class ParticipationTypePolicy < ApplicationPolicy

    def index?
      allow?(21132)
    end

    def new?
      allow?(21131)
    end

    def edit?
      allow?(21131)
    end

    def destroy?
      allow?(21131)
    end
  end
end