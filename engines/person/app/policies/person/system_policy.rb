module Person
	class SystemPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end

		def index?
			allow?(41317)
		end

		def create?
			allow?(41314)
		end

		def update?
			allow?(41315)
		end

		def destroy?
			allow?(41316)
		end
	end
end
