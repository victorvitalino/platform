module Helpdesk
	class OrderServicePolicy < ApplicationPolicy
		def index?
			#allow?(2103)
			true
		end

		def create?
			#allow?(2101)
			true
		end

		def update?
			allow?(2101)
		end

		def destroy?
			allow?(2102)
		end
	end
end
