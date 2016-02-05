require_dependency "person/application_controller"

module Person
	class SystemsController < ApplicationController
		before_action :set_systems, only: [:index, :create, :destroy, :update]
		before_action :set_system, only: [:edit, :destroy, :update]

		def index
			authorize :system,  :index?
		end

		def new
			@system = System.new
			authorize :system,  :create?
		end

		def create
			@system = System.new(system_params)
			authorize :system,  :create?
			@system.save
		end

		def edit
		end

		def update
			authorize :system,  :update?
			@system.update(system_params)
		end

		def destroy
			authorize :system,  :destroy?
			if @system.destroy
				redirect_to action: 'index'
			end
		end

		private

		def system_params
			params.require(:system).permit(:name, :code,:status, :system_module_id)
		end

		def set_systems
			@systems = System.all.order(:code)
		end

		def set_system
			@system = System.find(params[:id])
		end
	end
end
