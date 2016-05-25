module Protocol
	class ControlRoutePolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31909)
		end
		def create?
			allow?(31910)
		end
		def update?
			allow?(31911)
		end
		def destroy?
			allow?(31912)
		end
	end
end
