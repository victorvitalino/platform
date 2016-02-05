module Person
	class JobPolicy < ApplicationPolicy
             def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(41313)
		end

		def create?
			allow?(41310)
		end

		def update?
			allow?(41311)
		end

		def destroy?
			allow?(41312)
		end

	end
end
