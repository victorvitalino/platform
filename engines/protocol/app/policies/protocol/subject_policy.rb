module Protocol
	class SubjectPolicy < ApplicationPolicy
		def index?
			allow?(4503)
		end
		def create?
			allow?(4501)
		end
		def update?
			allow?(4501)
		end
		def destroy?
			allow?(4502)
		end
	end
end
