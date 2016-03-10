module Concourse
  class CandidatePolicy < ApplicationPolicy

    def index?
      allow?(21107)
    end

    def edit?
      allow?(21109)
    end

    def new_observation?
      allow?(21108)
    end
    

    def winners?
      allow?(21133)
    end


  end
end