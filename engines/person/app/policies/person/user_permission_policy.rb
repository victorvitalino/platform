module Person
	class UserPermissionPolicy < ApplicationPolicy

		def index?
			allow?(1703)
<<<<<<< HEAD
		end		
=======
		end

>>>>>>> 2528664460f849f7167bcfc009a7c64ad29d697e
		def enable?
			allow?(1701)
		end

		def disable?
			allow?(1701)
		end
	end
end
