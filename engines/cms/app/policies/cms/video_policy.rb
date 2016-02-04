module Cms
	class VideoPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end

		def index?
			allow?(21032)
		end


	end
end
