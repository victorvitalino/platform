require_dependency 'dashboard/application_controller'

module Dashboard
	class HomeController < ApplicationController

  	def index
			  @tickets = Helpdesk::Ticket.where(requester_id: current_user.id).order('created_at DESC')
				@birthday_person = Person::Staff.where("status = true and date_part('month', born) = ?", Date.today.month).order("date_part('day', born) asc")
				#@branch_line = Person::BranchLine.order(:telephone)
		end

	end
end
