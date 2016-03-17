module Address
  class UnitPolicy < ApplicationPolicy

    def view_nav?
      self.index? || self.seat?
    end

 def index?
      allow?(11204)
    end

    def create?
      allow?(11201)
    end

    def update?
      allow?(11202)
    end


    def destroy?
      allow?(11203)
    end

  end
end
