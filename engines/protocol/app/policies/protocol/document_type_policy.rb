module Protocol
	class DocumentTypePolicy < ApplicationPolicy
		def index?
			allow?(4403)
		end
		def create?
			allow?(4401)
		end
		def update?
			allow?(4401)
		end
		def destroy?
			allow?(4402)
		end
	end
end
