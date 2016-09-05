require_dependency "core/application_controller"

module Core
	class NavsController < ApplicationController
		before_action :set_navs, only: [:index, :create, :destroy, :update]
		before_action :set_nav, only: [:edit, :destroy, :update]


		has_scope :status

		def index
		   #authorize :sector,  :index?
		end

		def new
			@nav = Nav.new
			#authorize :sector,  :create?
		end

		def create
			@nav = Nav.new(nav_params)
			@nav.staff_id = current_user.id
			#authorize :sector,  :create?
			@nav.save
		end

		def edit
		end

		def update
			#authorize :sector,  :update?
			@nav.update(nav_params)
		end

		def destroy
			#authorize :sector,  :destroy?
			if @nav.destroy
				redirect_to action: 'index'
			end
		end

		private

		def nav_params
			params.require(:nav).permit(:name,:description,:order, :status,:code,:only_admin)
		end

		def set_navs
			@navs = Nav.all
		end

		def set_nav
			@nav = Nav.find(params[:id])
		end
	end
end
