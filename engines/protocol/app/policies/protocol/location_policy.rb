module Protocol
	class LocationPolicy < ApplicationPolicy
		def index?
			allow?(4603)
		end
		def create?
			allow?(4601)
		end
		def update?
			allow?(4601)
		end
		def destroy?
			allow?(4602)
		end
	end
end
