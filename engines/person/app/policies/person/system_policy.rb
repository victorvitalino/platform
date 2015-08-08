module Person
	class SystemPolicy < ApplicationPolicy
		def index?
			#allow?(1403)
			true
		end

		def create?
			#allow?(1401)
			true

		end

		def update?
			#allow?(1401)
			true
		end

		def destroy?
			#allow?(1402)
			true
		end
	end
end
