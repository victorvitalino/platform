module Person
	class SystemPermissionPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end

		def index?
			allow?(41318)
		end

		def create?
			allow?(41318)
		end

		def update?
			allow?(41318)
		end

		def destroy?
			allow?(41318)
		end
	end
end
