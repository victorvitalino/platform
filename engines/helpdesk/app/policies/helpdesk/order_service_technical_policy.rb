module Helpdesk
	class OrderServiceTechnicalPolicy < ApplicationPolicy
		def index?
			allow?(2105)
		end
	end
end
