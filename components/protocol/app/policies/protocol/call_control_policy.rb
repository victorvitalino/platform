module Protocol
	class CallControlPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(32001)
		end

		def create?
			allow?(32002)
		end

		def update?
			allow?(32003)
		end

		def destroy?
			allow?(32004)
		end
	end
end
