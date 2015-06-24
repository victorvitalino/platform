module Person
	class UserPolicy < ApplicationPolicy

		def index?
			true
		end

	end
end