module Person
	class JobPolicy < ApplicationPolicy

		def index?
			#allow?(1203)
			true
		end

		def create?
			#allow?(1201)
			true
		end

		def update?
			#allow?(1201)
			true
		end

		def destroy?
			#allow?(1202)
			true
		end

	end
end
