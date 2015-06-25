module Person
	class BranchLinePolicy < ApplicationPolicy
		def index?
			allow?(1103)
		end

		def create?
			allow?(1101)
		end

		def update?
			allow?(1101)
		end

		def destroy?
			allow?(1102)
		end
	end
end
