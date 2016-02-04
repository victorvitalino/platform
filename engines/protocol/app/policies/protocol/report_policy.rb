module Protocol
  class ReportPolicy < ApplicationPolicy
    def view_nav?
            self.index? || self.seat?
        end
    def create?
      allow?(31301)
    end

  end
end