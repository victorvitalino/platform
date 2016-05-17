module Protocol
	class SolicitationPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31801)
		end
		def create?
			allow?(31802)
		end
		def update?
			allow?(31803)
		end
		def destroy?
			allow?(31804)
		end
	end
end
