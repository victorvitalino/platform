module Protocol
	class DigitalDocumentPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31604)
		end
		def create?
			allow?(31601)
		end
		def update?
			allow?(31602)
		end
		def destroy?
			allow?(31603)
		end
	end
end
