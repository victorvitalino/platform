module Protocol
	class DigitalDocumentPolicy < ApplicationPolicy
		def index?
			allow?(4703)
		end
		def create?
			allow?(4701)
		end
		def update?
			allow?(4701)
		end
		def destroy?
			allow?(4702)
		end
	end
end
