module Helpdesk
	class MonitorServiceOrderPolicy < ApplicationPolicy
		def index?
			allow?(2203)
		end

		def create?
			allow?(2201)
		end

		def assume?
			allow?(2105)
		end

		def get_image?
			allow?(2203)
		end

		def close_order_service?
			allow?(2105)
		end

		def open_again?
			allow?(2104)
		end

		def update?
			allow?(2201)
		end

		def destroy?
			allow?(2202)
		end
	end
end
