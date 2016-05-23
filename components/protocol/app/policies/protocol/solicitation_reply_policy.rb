module Protocol
	class SolicitationReplyPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31805)
		end
		def create?
			allow?(31806)
		end
		def update?
			allow?(31807)
		end
		def destroy?
			allow?(31808)
		end
		def validate?
			allow?(31809)
		end
	end
end
