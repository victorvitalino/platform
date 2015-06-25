module Person
	class SystemPermissionPolicy < ApplicationPolicy
		def index?
			allow?(1503)
		end

		def create?
			allow?(1501)
		end

		def update?
			allow?(1501)
		end

		def destroy?
			allow?(1502)
		end
	end
end
