module Candidate
  class CadastrePolicy < ApplicationPolicy

    def view_nav?
      self.index? || self.seat?
    end

    def index?
      allow?(11005)
    end

    def create?
      false
    end

    def update?
      allow?(11001)
    end

    def update_cpf?
      allow?(11002)
    end

    def update_situation?
      allow?(11003)
    end
    
    def update_procedural?
      allow?(11004)
    end
    
    def seat?
      allow?(11011)
    end

    def create_seat?
      allow?(11012)
    end

    def update_seat?
      allow?(11013)
    end

    def destroy?
      false
    end

  end
end
