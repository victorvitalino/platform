module Person
	class UserPolicy < ApplicationPolicy

		def index?
			false
		end

	end
end