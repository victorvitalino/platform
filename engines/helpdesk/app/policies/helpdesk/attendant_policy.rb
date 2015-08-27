module Helpdesk
	class AttendantPolicy < ApplicationPolicy
		def index?
			allow?(2303)
		end

		def create?
			allow?(2301)
		end

		def update?
			allow?(2301)
		end

		def destroy?
			allow?(2302)
		end

		def report?
			allow?(2304)
		end
	end
end
