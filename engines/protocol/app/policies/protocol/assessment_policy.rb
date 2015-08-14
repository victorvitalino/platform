module Protocol
	class AssessmentPolicy < ApplicationPolicy
			def index?
			allow?(4103)
		end
		def create?
			allow?(4101)
		end
		def update?
			allow?(4101)
		end
		def destroy?
			allow?(4102)
		end
	end
end
