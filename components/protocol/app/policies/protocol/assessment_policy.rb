module Protocol
	class AssessmentPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31004)
		end
		def create?
			allow?(31001)
		end
		def update?
			allow?(31002)
		end
		def destroy?
			allow?(31003)
		end
	end
end
