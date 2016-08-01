module Concourse
  class ReportPolicy < ApplicationPolicy

    def index?
      allow?(51101)
    end

  end
end
