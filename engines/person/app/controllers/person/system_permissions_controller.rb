require_dependency "person/application_controller"

module Person
	class SystemPermissionsController < ApplicationController
		before_action :set_system_permissions, only: [:index, :create, :destroy, :update]
		before_action :set_system_permission, only: [:edit, :destroy, :update]

		def index
		end

		def new
			@system_permission = SystemPermission.new
		end

		def create
			@system_permission = SystemPermission.new(system_permission_params)
			@system_permission.save
		end

		def edit
		end

		def update
			@system_permission.update(system_permission_params)
		end

		def destroy
			if @system_permission.destroy
				redirect_to action: 'index'
			end
		end

		private

		def system_permission_params
			params.require(:system_permission).permit(:action, :code,:status,:system_id)
		end

		def set_system_permissions
			@system_permissions = SystemPermission.all
		end

		def set_system_permission
			@system_permission = SystemPermission.find(params[:id])
		end
	end
end
