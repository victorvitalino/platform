require_dependency "person/application_controller"

module Person
	class SystemPermissionsController < ApplicationController
		before_action :set_system
		before_action :set_system_permissions, only: [:index, :new,:create, :destroy]
		before_action :set_system_permission, only: [:destroy]

		def index
			authorize :system_permission,  :index?
#			authorize @system_permissions
		end

		def new
			authorize :system_permission,  :create?
			@system_permission = @system.system_permissions.new
			authorize @system_permission
		end

		def create
			authorize :system_permission,  :create?
			@system_permission = @system.system_permissions.new(system_permission_params)
			authorize @system_permission
			@system_permission.save
		end


		def destroy
			authorize :system_permission,  :destroy?
			authorize @system_permission
			@system_permission.destroy
		end

		private

		def system_permission_params
			params.require(:system_permission).permit(:action, :code,:status,:system_id)
		end

		def set_system
			@system = System.find(params[:system_id])
		end

		def set_system_permissions
			@system_permissions = SystemPermission.where(:system_id => params[:system_id])
		end

		def set_system_permission
			@system_permission = SystemPermission.find(params[:id])
		end
	end
end
