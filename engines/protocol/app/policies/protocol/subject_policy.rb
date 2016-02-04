module Protocol
	class SubjectPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31408)
		end
		def create?
			allow?(31405)
		end
		def update?
			allow?(31406)
		end
		def destroy?
			allow?(31407)
		end
	end
end
