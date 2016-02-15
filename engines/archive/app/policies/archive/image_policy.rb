module Archive
  class ImagePolicy < ApplicationPolicy
    
    def index?
      allow?(21204)
    end

    def create?
      allow?(21203)
    end
    
  end
end