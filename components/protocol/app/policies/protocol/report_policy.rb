module Protocol
  class ReportPolicy < ApplicationPolicy
    def view_nav?
            self.index? || self.seat?
        end
    def create?
      allow?(31301)
    end

    def index?
      allow?(31302)
    end

  end
end
