module Regularization
  class RequerimentPolicy < ApplicationPolicy

    def view_nav?
      self.index? || self.seat?
    end

    def index?
      allow?(119110)
    end

  end
end
