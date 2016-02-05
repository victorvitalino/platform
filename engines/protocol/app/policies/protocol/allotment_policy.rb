module Protocol
	class AllotmentPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31504)
		end
		def create?
			allow?(31501)
		end
		def update?
			allow?(31502)
		end
		def destroy?
			allow?(31503)
		end
	end
end
