module Protocol
	class AllotmentPolicy < ApplicationPolicy
		def index?
			allow?(4203)
		end
		def create?
			allow?(4201)
		end
		def update?
			allow?(4201)
		end
		def destroy?
			allow?(4202)
		end
	end
end
