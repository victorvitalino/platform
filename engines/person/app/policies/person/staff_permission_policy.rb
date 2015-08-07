module Person
	class StaffPermissionPolicy < ApplicationPolicy

		def index?
			#allow?(1703)
			true
		end
		
		def enable?
			#allow?(1701)
			true
		end

		def disable?
			#allow?(1701)
			true
		end
	end
end
