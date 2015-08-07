module Person
	class BranchLinePolicy < ApplicationPolicy
		def index?
			#allow?(1103)
			true
		end

		def create?
			#allow?(1101)
			true
		end

		def update?
			#allow?(1101)
			true
		end

		def destroy?
			#allow?(1102)
			true
		end
	end
end
