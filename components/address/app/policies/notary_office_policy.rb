module Address
  class NotaryOfficePolicy < ApplicationPolicy

    def view_nav?
      self.index? || self.seat?
    end


    def create?
      allow?(11205)
    end

    def update?
      allow?(11206)
    end


  end
end
