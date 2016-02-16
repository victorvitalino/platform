module Candidate
  class CadastreAddressPolicy < ApplicationPolicy

    def view_nav?
      self.index? || self.seat?
    end

    def index?
      allow?(11011)
    end

    def create?
      allow?(11012)
    end

    def update?
      allow?(11013)
    end



  end
end
