module Person
	class UserPermissionPolicy < ApplicationPolicy
		def index?
			allow?(1703)
		end

		def create?
			allow?(1701)
		end

		def update?
			allow?(1701)
		end

		def destroy?
			allow?(1702)
		end
	end
end