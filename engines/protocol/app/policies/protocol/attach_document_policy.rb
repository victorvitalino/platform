module Protocol
  class AttachDocumentPolicy < ApplicationPolicy
    def view_nav?
            self.index? || self.seat?
        end
    def index?
      allow?(31704)
    end
    def add_append?
      allow?(31702)
    end
    def add_attach?
      allow?(31701)
    end
    def destroy?
      allow?(31703)
    end
  end
end
