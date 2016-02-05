module Person
	class SectorPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(41309)
		end

		def create?
			allow?(41306)
		end

		def update?
			allow?(41307)
		end

		def destroy?
			allow?(41308)
		end
	end
end
