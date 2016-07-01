module Entity
  class ReportPolicy < ApplicationPolicy

    def index?
      allow?(51002)
    end

  end
end
