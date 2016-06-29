module Candidate
  class ReportPolicy < ApplicationPolicy

    def index?
      allow?(51001)
    end

  end
end
