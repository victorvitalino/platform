module Archive
  class DocumentPolicy < ApplicationPolicy
    
    def index?
      allow?(21202)
    end

    def create?
      allow?(21201)
    end
    
  end
end