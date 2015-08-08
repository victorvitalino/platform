module Person
	class SectorPolicy < ApplicationPolicy
		def index?
			#allow?(1303)
			true
		end

		def create?
			#allow?(1301)
			true
		end

		def update?
			#allow?(1301)
			true
		end

		def destroy?
			#llow?(1302)
			true
		end
	end
end
