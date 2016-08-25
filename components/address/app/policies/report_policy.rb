module Address
  class ReportPolicy < ApplicationPolicy

    def view_nav?
      self.index? || self.seat?
    end

    def index?
      allow?(51201)
    end

  end
end
