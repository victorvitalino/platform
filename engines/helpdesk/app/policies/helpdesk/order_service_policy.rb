module Helpdesk
	class OrderServicePolicy < ApplicationPolicy
		def index?
			allow?(2103)
		end

		def create?
			allow?(2101)
		end

		def update?
			allow?(2101)
		end

		def destroy?
			allow?(2102)
		end

		def assume?
			allow?(2204)
		end

		def get_image?
			allow?(2203)
		end

		def close_order_service?
			allow?(2205)
		end
	end
end
