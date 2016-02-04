module Protocol
	class LocationPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31204)
		end
		def create?
			allow?(31201)
		end
		def update?
			allow?(31202)
		end
		def destroy?
			allow?(31203)
		end
	end
end
