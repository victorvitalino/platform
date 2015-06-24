module Person
	class JobPolicy < ApplicationPolicy

		def index?
			allow?(1203)
		end

		def create?
			allow?(1201)
		end

		def update?
			allow?(1201)
		end

		def destroy?
			allow?(1202)
		end

	end
end