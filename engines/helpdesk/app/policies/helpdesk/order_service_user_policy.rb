module Helpdesk
	class OrderServiceUserPolicy < ApplicationPolicy
		def index?
			true
		end
	end
end
