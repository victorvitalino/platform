module Person
	class SystemPermissionPolicy < ApplicationPolicy
		def index?
			#allow?(1503
			true
		end

		def create?
			#allow?(1501)
			true
		end

		def update?
			#allow?(1501)
			true
		end

		def destroy?
			#allow?(1502)
			true
		end
	end
end
