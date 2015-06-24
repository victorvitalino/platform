module Person
	class SystemPolicy < ApplicationPolicy
		def index?
			allow?(1403)
		end

		def create?
			allow?(1401)
		end

		def update?
			allow?(1401)
		end

		def destroy?
			allow?(1402)
		end
	end
end