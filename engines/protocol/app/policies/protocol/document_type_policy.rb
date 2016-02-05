module Protocol
	class DocumentTypePolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31404)
		end
		def create?
			allow?(31401)
		end
		def update?
			allow?(31402)
		end
		def destroy?
			allow?(31403)
		end
	end
end
