require_dependency "person/application_controller"

module Person
	class UserPermissionsController < ApplicationController
		layout 'layouts/material'
		before_action :set_user_permissions, only: [:index]

    def index

    end

   private

	def set_user_permissions
		@systems = System.all
	end

  end
end
