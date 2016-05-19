module Protocol
	class ControlPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31901)
		end
		def create?
			allow?(31902)
		end
		def update?
			allow?(31903)
		end
		def destroy?
			allow?(31904)
		end
	end
end
