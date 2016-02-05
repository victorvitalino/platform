module Person
	class StaffPolicy < ApplicationPolicy
              def view_nav?
      		  self.index? || self.seat?
    		end

		def index?
			allow?(41304)
		end

		def create?
			allow?(41301)
		end

		def update?
			allow?(41302)
		end

		def destroy?
			allow?(41303)
		end
	end
end
