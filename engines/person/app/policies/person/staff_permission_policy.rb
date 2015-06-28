module Person
	class StaffPermissionPolicy < ApplicationPolicy

		def index?
			allow?(1703)
		end
		
		def enable?
			allow?(1701)
		end

		def disable?
			allow?(1701)
		end
	end
end
