module Entity
  class ReportPolicy < ApplicationPolicy

    def view_nav?
      self.index? || self.seat?
    end

    def index?
      allow?(11502)
    end

  end
end
