module Address
  class ReportPolicy < ApplicationPolicy

    def index?
      allow?(51201)
    end

  end
end
