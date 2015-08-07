module Person
	class StaffPolicy < ApplicationPolicy

		def index?
			#allow?(1603)
			true
		end

		def create?
			#allow?(1601)
			true
		end

		def update?
			#allow?(1601)
			true
		end

		def destroy?
			#allow?(1602)
			true
		end
	end
end
