module Protocol
	class SolicitationProvidencePolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31809)
		end
		def create?
			allow?(31810)
		end
		def update?
			allow?(31811)
		end
		def destroy?
			allow?(31812)
		end
	end
end
