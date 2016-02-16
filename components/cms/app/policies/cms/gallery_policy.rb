module Cms
  class GalleryPolicy < ApplicationPolicy
    def view_nav?
            self.index? || self.seat?
        end

    def index?
      allow?(21026)
    end

    def create?
      allow?(21021)
    end

    def update?
      allow?(21022)
    end

    def destroy?
      allow?(21023)
    end

    def publish?
      allow? (21024)
    end

    def review?
      allow? (21025)
    end

  end
end
