module Helpdesk
	class OrderServiceUserPolicy < ApplicationPolicy
		def index?
			allow?(2104)
		end
	end
end
