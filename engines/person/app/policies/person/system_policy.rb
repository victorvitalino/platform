module Person
	class SystemPolicy < ApplicationPolicy
		
		def index?
			true
		end
		
	end
end