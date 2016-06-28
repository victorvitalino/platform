module Candidate
  class ReportPolicy < ApplicationPolicy

    def view_nav?
      self.index? || self.seat?
    end

    def index?
      allow?(11020)
    end

  end
end
