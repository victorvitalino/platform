module Protocol
	class ControlInterestedPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31905)
		end
		def create?
			allow?(31906)
		end
		def update?
			allow?(31907)
		end
		def destroy?
			allow?(31908)
		end
	end
end
